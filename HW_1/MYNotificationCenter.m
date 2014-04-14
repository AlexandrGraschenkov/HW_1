//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"
#import "Obj_Reg.h"

@interface MYNotificationCenter()

@end

@implementation MYNotificationCenter{
    NSMutableDictionary *regObjByNotName;
}

+ (instancetype)sharedInstance{
    static MYNotificationCenter *cen = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cen = [[MYNotificationCenter alloc] init];
    });
    return cen;
}
-(id)init{
    self = [super init];
    if(self){
        regObjByNotName = [NSMutableDictionary new];
    }
    return self;
}

// можно только 1 раз подписаться обьекту на событие
- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name
{
    NSMutableArray *regObject;
    if([regObjByNotName objectForKey:name]){
        regObject = [regObjByNotName objectForKey:name];
    }
    else{
        regObject = [NSMutableArray new];
        [regObjByNotName setObject:regObject forKey:name];
    }
    BOOL registred = NO;
    for(Obj_Reg *objectRegistered in regObject){
        if(objectRegistered.obj == obj){
           registred = YES;
        }
    }
    if(!registred){
        Obj_Reg *a = [[Obj_Reg alloc] initWithObject:obj andSelector:selector];
        [regObject addObject:a];
    }
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name
{
    if([regObjByNotName objectForKey:name]){
        NSMutableArray *regArray=[regObjByNotName objectForKey:name];
        for(Obj_Reg *new_array in regArray){
            if(new_array.obj == obj){
                [regArray removeObject:new_array];
                break;
            }
        }
    }
}

- (void)unregisterObject:(id)obj
{
    NSArray *names=[regObjByNotName allKeys];
    for(NSString *name in names){
        [self unregisterObject:obj notificationName:name];
    }
}

- (void)postNotificationWithName:(NSString*)name
{
    if([regObjByNotName objectForKey:name]){
        for(Obj_Reg *objects in [regObjByNotName  objectForKey:name]){
            ((void (*)(id, SEL))[objects.obj methodForSelector:objects.sel])(objects.obj, objects.sel);
        }
    }
}

@end
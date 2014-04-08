//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"
#import "RegisteredObjects.h"
@interface MYNotificationCenter()

@end

@implementation MYNotificationCenter{
    NSMutableDictionary *registeredObjectsByNotificationName;
}

+ (instancetype)sharedInstance{
    static MYNotificationCenter *center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[MYNotificationCenter alloc] init];
    });
    return center;
}
-(id)init{
    self=[super init];
    if(self){
        registeredObjectsByNotificationName=[NSMutableDictionary new];
    }
    return self;
}

// можно только 1 раз подписаться обьекту на событие
- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name
{
    NSMutableArray *registeredObjects;
    if([registeredObjectsByNotificationName objectForKey:name]){
        registeredObjects=[registeredObjectsByNotificationName objectForKey:name];
    }else{
        registeredObjects=[NSMutableArray new];
        [registeredObjectsByNotificationName setObject:registeredObjects forKey:name];
    }
    BOOL isAlreadyRegistered=NO;
    for(RegisteredObjects *registeredObject in registeredObjects){
        if(registeredObject.object==obj){
            isAlreadyRegistered=YES;
        }
    }
    if(!isAlreadyRegistered){
        RegisteredObjects *newOne=[[RegisteredObjects alloc] initWithObject:obj andSelector:selector];
        [registeredObjects addObject:newOne];
    }
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name
{
    if([registeredObjectsByNotificationName objectForKey:name]){
        NSMutableArray *registeredObjects=[registeredObjectsByNotificationName objectForKey:name];
        for(RegisteredObjects *registeredObject in registeredObjects){
            if(registeredObject.object==obj){
                [registeredObjects removeObject:registeredObject];
                break;
            }
        }
    }
}

- (void)unregisterObject:(id)obj
{
    NSArray *names=[registeredObjectsByNotificationName allKeys];
    for(NSString *name in names){
        [self unregisterObject:obj notificationName:name];
    }
}

- (void)postNotificationWithName:(NSString*)name
{
    if([registeredObjectsByNotificationName objectForKey:name]){
        for(RegisteredObjects *objects in [registeredObjectsByNotificationName objectForKey:name]){
            ((void (*)(id, SEL))[objects.object methodForSelector:objects.selector])(objects.object, objects.selector);
        }
    }
}

@end

//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"
#import "Object.h"

@interface MYNotificationCenter()
{
    NSMutableDictionary *obs;
}
@end

@implementation MYNotificationCenter

+ (instancetype)sharedInstance
{
    static id _sing = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{_sing = [self new];});
    return _sing;
}

- (id)init
{
 	self = [super init];
 	if (self) {
        obs = [NSMutableDictionary new];
    }
 	return self;
}

// можно только 1 раз подписаться обьекту на событие
- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name
{
    NSMutableSet *reg = nil;
    if ([obs objectForKey:name] != Nil) {
        reg = [obs objectForKey:name];
    } else {
        reg = [NSMutableSet set];
        [obs setObject:reg forKey:name];
    }
    BOOL found = NO;
    for (Object *regpair in reg) {
        if (regpair.getObj == obj) {
            found = YES;
        }
    }
    if (!found) {
        Object *pair = [[Object alloc] initWithObj:obj sel:selector];
        [reg addObject:pair];
    }
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name
{
    if ([obs objectForKey:name]) {
        NSMutableSet *reg = [obs objectForKey:name];
        Object *pairdel = nil;
        for (Object *pair in reg) {
            if (pair.getObj == obj) {
                pairdel = pair;
            }
        }
        [reg removeObject:pairdel];
    }
}

- (void)unregisterObject:(id)obj
{
    NSArray *notificationNames = [obs allKeys];
 	for (NSString *name in notificationNames) {
        [self unregisterObject:obj notificationName:name];
    }
}

- (void)postNotificationWithName:(NSString*)name
{
    if ([obs objectForKey:name]) {
        NSArray *reg = [obs objectForKey:name];
        for (Object *pair in reg) {
            if ([pair.getObj respondsToSelector:pair.getSelector]) {
                ((void (*)(id, SEL))[pair.getObj methodForSelector:pair.getSelector])(pair.getObj, pair.getSelector);
            }
        }
    }
}

@end

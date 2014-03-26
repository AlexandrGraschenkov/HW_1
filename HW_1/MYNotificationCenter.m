//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"
#import "LPObjectSelectorPair.h"

@implementation MYNotificationCenter {
    NSMutableDictionary *observers;
}

+ (instancetype)sharedInstance {
    static MYNotificationCenter *notificationCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notificationCenter = [[MYNotificationCenter alloc] init];
    });
    return notificationCenter;
}

- (id)init {
    self = [super init];
    if (self) {
        observers = [NSMutableDictionary dictionary];
    }
    return self;
}

// можно только 1 раз подписаться обьекту на событие
- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name {
    if (!obj || !selector || name == (id)[NSNull null] || name.length == 0) {
        return;
    }
    
    NSMutableSet *registeredObjects = nil;
    if ([observers objectForKey:name] != nil) {
        registeredObjects = [observers objectForKey:name];
    } else {
        registeredObjects = [NSMutableSet set];
        [observers setObject:registeredObjects forKey:name];
    }
    
    /*LPObjectSelectorPair *pair = [[LPObjectSelectorPair alloc] initWithObject:obj andSelector:selector];
    [registeredObjects addObject:pair];*/
    
    BOOL found = NO;
    for (LPObjectSelectorPair *registeredPair in registeredObjects) {
        if (registeredPair.object == obj) {
            found = YES;
            break;
        }
    }
    if (!found) {
        LPObjectSelectorPair *pair = [[LPObjectSelectorPair alloc] initWithObject:obj andSelector:selector];
        [registeredObjects addObject:pair];
    }
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name {
    if ([observers objectForKey:name]) {
        NSMutableSet *registeredObjects = [observers objectForKey:name];
        
        LPObjectSelectorPair *pairToRemove = nil;
        for (LPObjectSelectorPair *pair in registeredObjects) {
            if (pair.object == obj) {
                pairToRemove = pair;
                break;
            }
        }
        
        
        [registeredObjects removeObject:pairToRemove];
    }
}

- (void)unregisterObject:(id)obj {
    if (!obj) {
        return;
    }
    
    NSArray *notificationNames = [observers allKeys];
    for (NSString *name in notificationNames) {
        [self unregisterObject:obj notificationName:name];
    }
}

- (void)postNotificationWithName:(NSString*)name {
    if ([observers objectForKey:name]) {
        NSArray *registeredObjects = [observers objectForKey:name];
        for (LPObjectSelectorPair *pair in registeredObjects) {
            if ([pair.object respondsToSelector:pair.selector]) {
                ((void (*)(id, SEL))[pair.object methodForSelector:pair.selector])(pair.object, pair.selector);
            }
        }
    }
}

@end

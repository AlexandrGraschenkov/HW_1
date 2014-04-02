//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"

@interface MYNotificationCenter()

@property (strong, nonatomic) NSMutableDictionary *receivers; //key: (NSString *)stationName; value: NSMutableDictionary

@end

@implementation MYNotificationCenter
+ (instancetype)sharedInstance {
    
    static dispatch_once_t once;
    static MYNotificationCenter *instance;
    dispatch_once(&once, ^{
        instance = [[MYNotificationCenter alloc] init];
    });
    return instance;
}


-(NSMutableDictionary *)receivers {
    if (!_receivers) {
        _receivers = [[NSMutableDictionary alloc] init];
    }
    return _receivers;
}


- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name {
    
    NSLog(@"HELLO");
    if (![_receivers objectForKey:name]) {
        NSMutableDictionary *pairs = [[NSMutableDictionary alloc] init];
        [pairs setObject:NSStringFromSelector(selector) forKey:obj];
        [_receivers setObject:pairs forKey:name];
    }
    else {
        NSMutableDictionary *temp = [_receivers objectForKey:name];
        if (![temp objectForKey:obj]) {
            [temp setObject:NSStringFromSelector(selector) forKey:obj];
        }
    }
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name {
    if ([_receivers objectForKey:name]) {
        NSMutableDictionary *temp = [_receivers objectForKey:name];
        if ([temp objectForKey:obj]) {
            [temp removeObjectForKey:obj];
        }
    }
}

- (void)unregisterObject:(id)obj {
    NSArray *keys = [_receivers allKeys];
    for (NSString *string in keys) {
        [self unregisterObject:obj notificationName:string];
    }
}

- (void)postNotificationWithName:(NSString*)name {
    
    if ([_receivers objectForKey:name]) {
        NSDictionary *objectsAndSelectors = [_receivers objectForKey:name];
        NSArray *objectsAsKeys = [objectsAndSelectors allKeys]; // got all objects
        for (id thingToBeNotified in objectsAsKeys) {
//            NSLog(@"%@\n", [objectsAndSelectors objectForKey:thingToBeNotified]);
            
            SEL selector = NSSelectorFromString([objectsAndSelectors objectForKey:thingToBeNotified]);
            if ([thingToBeNotified respondsToSelector:selector]) {
                NSLog(@"F*CK! There are no logs during the test run! There is awful NSDictionary in the another NSDisctionary! I can't feel my eyes cause of pain was given by this task");
                [thingToBeNotified performSelector:selector];
            }
        }
    }
    
    
}

@end

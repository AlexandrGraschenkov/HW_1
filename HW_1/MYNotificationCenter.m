//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"

@interface MYNotificationCenter()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation MYNotificationCenter
+ (instancetype)sharedInstance
{
    static MYNotificationCenter *singeton;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^(){
        singeton = [[MYNotificationCenter alloc] init];
        singeton.dictionary = [NSMutableDictionary new];
    });
    return singeton;
}

- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name
{
    // подписать объект obj с методом selector на событие name
    if (![_dictionary valueForKey:name])
    {
        [_dictionary setValue:[NSMutableArray new] forKey:name];
    }
    NSMutableArray *arr = [_dictionary valueForKey:name];
    for (int i = 0; i < arr.count; i += 2)
    {
        if (arr[i] == obj)
        {
            arr[i+1] = NSStringFromSelector(selector);
            return;
        }
    }
    [arr addObject:obj];
    [arr addObject:NSStringFromSelector(selector)];
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name
{
    // отписать obj от события name
    if (![_dictionary valueForKey:name])
    {
        return;
    }
    NSMutableArray *arr = [_dictionary valueForKey:name];
    for (int i = 0; i < arr.count; i += 2)
    {
        if (arr[i] == obj)
        {
            [arr removeObjectAtIndex:i];
            [arr removeObjectAtIndex:i];
            return;
        }
    }
}

- (void)unregisterObject:(id)obj
{
    // отписать от всего
    for (NSMutableArray *arr in [_dictionary allValues])
    {
        for (int i = 0; i < arr.count; i += 2)
        {
            if (arr[i] == obj)
            {
                [arr removeObjectAtIndex:i];
                [arr removeObjectAtIndex:i];
            }
        }
    }
}

- (void)postNotificationWithName:(NSString*)name
{
    // произвести событие name
    NSMutableArray *arr = [_dictionary valueForKey:name];
    for (int i = 0; i < arr.count; i += 2)
    {
        id obj = arr[i];
        SEL sel = NSSelectorFromString(arr[i+1]);
        if ([obj respondsToSelector:sel])
        {
            [obj performSelector:sel];
        }
    }
}

@end

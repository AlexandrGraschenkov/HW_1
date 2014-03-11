//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"
#import "ObjectSelectorPair.h"


@interface MYNotificationCenter()

@property (strong, nonatomic) NSMutableDictionary *objects;

@end

@implementation MYNotificationCenter
+ (instancetype)sharedInstance
{
    static MYNotificationCenter *instance;
    if (!instance)
    {
        instance = [[MYNotificationCenter alloc] init];
        instance.objects = [[NSMutableDictionary alloc] init];
    }
    return instance;
}

// можно только 1 раз подписаться обьекту на событие
- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name
{
    if (![_objects objectForKey:name])
    {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [_objects setObject:dic forKey:name];
    }
    NSMutableDictionary *dic = [_objects objectForKey:name];
    NSValue *key = [NSValue valueWithNonretainedObject:obj];
    [dic setObject:[[ObjectSelectorPair alloc] initWithObject:obj andSelector:selector] forKey:key];
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name
{
    NSMutableDictionary *dic = [_objects objectForKey:name];
    NSValue *key = [NSValue valueWithNonretainedObject:obj];
    [dic removeObjectForKey:key];
}

- (void)unregisterObject:(id)obj
{
    NSArray *keys = [_objects allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSMutableDictionary *dic = [_objects objectForKey:keys[i]];
        NSValue *key = [NSValue valueWithNonretainedObject:obj];
        [dic removeObjectForKey:key];
    }
}

- (void)postNotificationWithName:(NSString*)name
{
    NSMutableDictionary *dic = [_objects valueForKey:name];
    NSArray *osps = [dic allValues];
    for (int i = 0; i < [osps count]; i++)
    {
        ObjectSelectorPair *pair = osps[i];
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [[pair getObject] performSelector:[pair getSelector]];
        #pragma clang diagnostic pop
    }
}

@end

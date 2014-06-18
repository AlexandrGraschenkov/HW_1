//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"
#import "SelectorInit.h"

@interface MYNotificationCenter()

@property (strong, nonatomic) NSMutableDictionary *objects;

@end

@implementation MYNotificationCenter
+ (instancetype)sharedInstance
{
    static MYNotificationCenter *notify;
    if (!notify)
    {
        notify = [[MYNotificationCenter alloc] init];
        notify.objects = [[NSMutableDictionary alloc] init];
        
    }
    return notify;
}

// можно только 1 раз подписаться обьекту на событие
- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)key
{
    if (![self.objects objectForKey:key])
    {
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        [self.objects setObject:dictionary forKey:key];
    }
    NSMutableDictionary *dictionary = [self.objects objectForKey:key];
    NSValue *seckey = [NSValue valueWithNonretainedObject:obj];
    [dictionary setObject:[[SelectorInit alloc] initWithObject:obj andSelector:selector] forKey:seckey];
    
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name
{
    NSMutableDictionary *dictionary = [self.objects objectForKey:name];
    NSValue *seckey = [NSValue valueWithNonretainedObject:obj];
    [dictionary removeObjectForKey:seckey];
}

- (void)unregisterObject:(id)obj
{
    NSArray *keys = [self.objects allKeys];
    for (int i=0; i<[keys count]; i++) {
        NSMutableDictionary *dictionary = [self.objects objectForKey:keys[i]];
        NSValue *seckey = [NSValue valueWithNonretainedObject:obj];
        [dictionary removeObjectForKey:seckey];
    }
}

- (void)postNotificationWithName:(NSString*)name
{
    NSMutableDictionary *dictionary = [self.objects objectForKey:name];
    NSArray *gotcha = [dictionary allValues];
    for (int i=0; i<[gotcha count]; i++)
    {
        SelectorInit *selInit = gotcha[i];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [[selInit getObject] performSelector:[selInit getSelector]];
#pragma clang diagnostic pop
    }
}

@end

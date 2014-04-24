//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"
#import "ObjectSelector.h"

@interface MYNotificationCenter()

@property (strong, nonatomic) NSMutableDictionary *allNotifications;

@end

@implementation MYNotificationCenter

+ (instancetype)sharedInstance
{
    static MYNotificationCenter *myNotification;
    
    if (!myNotification) {
        myNotification = [[MYNotificationCenter alloc]init];
        myNotification.allNotifications = [[NSMutableDictionary alloc]init];
    }
    
    return myNotification;
}

- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name
{
    
    if (![_allNotifications objectForKey:name])
        
    {
        NSMutableDictionary *newNotif = [[NSMutableDictionary alloc] init];
        [_allNotifications setObject:newNotif forKey:name];
    }
    NSMutableDictionary *newNotif = [_allNotifications objectForKey:name];
    NSValue *key = [NSValue valueWithNonretainedObject:obj];
    [newNotif setObject:[[ObjectSelector alloc] initWithObject:obj andWithSelector:selector] forKey:key];
    
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name
{

    NSMutableDictionary *dic = [_allNotifications objectForKey:name];
 	
    NSValue *key = [NSValue valueWithNonretainedObject:obj];
 	
    [dic removeObjectForKey:key];
}

- (void)unregisterObject:(id)obj
{
    NSArray *keys = [_allNotifications allKeys];
 	
    for (int i = 0; i < [keys count]; i++)
        
    {
        NSMutableDictionary *dic = [_allNotifications objectForKey:keys[i]];
        NSValue *key = [NSValue valueWithNonretainedObject:obj];
        [dic removeObjectForKey:key];
        
    }
}

- (void)postNotificationWithName:(NSString*)name
{

    NSMutableDictionary *notif = [_allNotifications valueForKey:name];
    NSArray *osps = [notif allValues];
    
    for (int i = 0; i < [osps count]; i++)
    {
        ObjectSelector *pair = osps[i];
        [[pair getObject] performSelector:[pair getSelector]];
    }
}

@end

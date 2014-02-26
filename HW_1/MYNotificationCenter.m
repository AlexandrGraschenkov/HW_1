//
//  MYNotificationCenter.m
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYNotificationCenter.h"

@interface MYNotificationCenter()

@end

@implementation MYNotificationCenter
+ (instancetype)sharedInstance
{
    return nil;
}

// можно только 1 раз подписаться обьекту на событие
- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name
{
    
}

- (void)unregisterObject:(id)obj notificationName:(NSString*)name
{
    
}

- (void)unregisterObject:(id)obj
{
    
}

- (void)postNotificationWithName:(NSString*)name
{
    
}

@end

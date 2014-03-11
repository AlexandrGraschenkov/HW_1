//
//  MYObjectForNotification.m
//  HW_1
//
//  Created by Amir Zigangarayev on 11.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MYObjectForNotification.h"

@interface MYObjectForNotification ()

@property (nonatomic) SEL selector;
@property (strong, nonatomic) id object;
@property (strong, nonatomic) NSString *notificationName;

@end

@implementation MYObjectForNotification

- (void) initOFNWithObject:(id)object selector:(SEL)selector notificationName:(NSString *)name
{
    _selector = selector;
    _object = object;
    _notificationName = name;
}

- (id) getObject
{
    return _object;
}

- (NSString *) getNotificationName
{
    return _notificationName;
}

- (void) performNotification
{
    if ([self respondsToSelector:_selector])
    {
        [self performSelector:_selector];
    }
}

@end

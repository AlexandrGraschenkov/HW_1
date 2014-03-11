//
//  MYObjectForNotification.h
//  HW_1
//
//  Created by Amir Zigangarayev on 11.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYObjectForNotification : NSObject

- (id) getObject;
- (NSString *) getNotificationName;
- (void) initOFNWithObject:(id)object selector:(SEL)selector notificationName:(NSString *)name;
- (void) performNotification;

@end

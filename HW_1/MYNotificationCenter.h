//
//  MYNotificationCenter.h
//  HW_1
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYNotificationCenter : NSObject

+ (instancetype)sharedInstance;
- (void)registerObject:(id)obj selector:(SEL)selector notificationName:(NSString*)name;
- (void)unregisterObject:(id)obj notificationName:(NSString*)name;
- (void)unregisterObject:(id)obj;
- (void)postNotificationWithName:(NSString*)name;

@end

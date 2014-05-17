//
//  LPObjectSelectorPair.h
//  HW_1
//
//  Created by Игорь Савельев on 26/03/14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPObjectSelectorPair : NSObject

@property (nonatomic, weak, readonly) id object;
@property (nonatomic, assign, readonly) SEL selector;

- (id)initWithObject:(id)obj andSelector:(SEL)selector;

@end

//
//  LPObjectSelectorPair.m
//  HW_1
//
//  Created by Игорь Савельев on 26/03/14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "LPObjectSelectorPair.h"

@implementation LPObjectSelectorPair

- (id)initWithObject:(id)obj andSelector:(SEL)selector {
    self = [self init];
    if (self) {
        _object = obj;
        _selector = selector;
    }
    return self;
}

@end

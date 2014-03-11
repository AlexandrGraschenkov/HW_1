//
//  ObjectSelectorPair.m
//  HW_1
//
//  Created by Amir Zigangarayev on 11.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ObjectSelectorPair.h"

@interface ObjectSelectorPair ()

@property (strong) id obj;
@property SEL selector;

@end

@implementation ObjectSelectorPair

- (id) initWithObject:(id)obj andSelector:(SEL)selector
{
    _obj = obj;
    _selector = selector;
    return self;
}

- (id) getObject
{
    return _obj;
}

- (SEL) getSelector
{
    return _selector;
}

@end

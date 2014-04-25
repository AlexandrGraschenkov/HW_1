//
//  ObjectSelector.m
//  HW_1
//
//  Created by Anastasia Tkachenko on 02.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ObjectSelector.h"

@implementation ObjectSelector

-(id)initWithObject: (id)object andWithSelector: (SEL)selector
{
    _object = object;
    _selector = selector;
    
    return self;
}

-(id) getObject
{
    return _object;
}

-(SEL) getSelector
{
    return _selector;
}

@end

//
//  SelectorInit.m
//  HW_1
//
//  Created by Maxim Stepanov on 17.06.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "SelectorInit.h"

@interface SelectorInit()

@property (strong) id obj;
@property SEL selector;

@end

@implementation SelectorInit

-(id) initWithObject:(id)obj andSelector:(SEL)selector
{
    self.obj = obj;
    self.selector = selector;
    return self;
}

-(id) getObject
{
    return self.obj;
}

-(SEL) getSelector
{
    return _selector;
}

@end

//
//  Object.m
//  HW_1
//
//  Created by Айдар on 02.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "Object.h"

@interface Object ()

    @property (nonatomic, strong) id obj;
    @property (nonatomic, assign) SEL selector;

@end

@implementation Object

- (id)initWithObj:(id)obj sel:(SEL)selector {
    self = [self init];
    if (self) {
        _obj = obj;
        _selector = selector;
    }
    return self;
}

- (id)getObj
{
    return _obj;
}

- (SEL)getSelector
{
    return _selector;
}

@end
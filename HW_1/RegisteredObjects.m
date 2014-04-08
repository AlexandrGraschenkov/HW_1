//
//  RegisteredObjects.m
//  HW_1
//
//  Created by nikiouch on 08.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "RegisteredObjects.h"

@implementation RegisteredObjects
@synthesize object;
@synthesize selector;
-(id)initWithObject:(id)_object andSelector:(SEL)_selector{
    self=[super init];
    if(self){
        object=_object;
        selector=_selector;
    }
    return self;
}
@end

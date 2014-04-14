//
//  Obj_Reg.m
//  HW_1
//
//  Created by Olga on 14.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "Obj_Reg.h"

@implementation Obj_Reg
@synthesize obj;

@synthesize sel;

-(id)initWithObject:(id)_obj andSelector:(SEL)_sel{
    self=[super init];
    if(self){
        obj=_obj;
        sel=_sel;
    }
 	return self;
}
@end

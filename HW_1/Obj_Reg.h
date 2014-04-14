//
//  Obj_Reg.h
//  HW_1
//
//  Created by Olga on 14.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Obj_Reg : NSObject{
    id obj;
    SEL sel;
}
@property id obj;
@property SEL sel;

-(id)initWithObject:(id)_obj andSelector:(SEL)_sel;
@end

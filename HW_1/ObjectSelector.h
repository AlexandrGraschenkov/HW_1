//
//  ObjectSelector.h
//  HW_1
//
//  Created by Anastasia Tkachenko on 02.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//



@interface ObjectSelector : NSObject

@property (strong) id object;
@property SEL selector;

-(id) initWithObject: (id)object andWithSelector: (SEL)selector;
-(id) getObject;
-(SEL) getSelector;

@end

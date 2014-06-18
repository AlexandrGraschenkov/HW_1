//
//  SelectorInit.h
//  HW_1
//
//  Created by Maxim Stepanov on 17.06.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectorInit : NSObject

-(id) initWithObject:(id)object andSelector:(SEL)selector;
-(id) getObject;
-(SEL) getSelector;

@end

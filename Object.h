//
//  Object.h
//  HW_1
//
//  Created by Айдар on 02.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object : NSObject

- (id)initWithObj:(id)obj sel:(SEL)selector;
- (id)getObj;
- (SEL)getSelector;

@end

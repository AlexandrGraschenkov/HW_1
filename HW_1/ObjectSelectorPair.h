//
//  ObjectSelectorPair.h
//  HW_1
//
//  Created by Amir Zigangarayev on 11.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectSelectorPair : NSObject

- (id) initWithObject:(id)obj andSelector:(SEL)selector;
- (id) getObject;
- (SEL) getSelector;

@end

//
//  RegisteredObjects.h
//  HW_1
//
//  Created by nikiouch on 08.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisteredObjects : NSObject{
    id object;
    SEL selector;
}
@property id object;
@property SEL selector;
-(id)initWithObject:(id)_object andSelector:(SEL)_selector;
@end

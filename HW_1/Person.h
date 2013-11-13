//
//  Person.h
//  HW_1
//
//  Created by Alexandr on 13.11.13.
//  Copyright (c) 2013 Alex Gra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (id)initWithFirsName:(NSString*)firstName lastName:(NSString*)lastName;
@property (nonatomic, assign) int age;
@property (nonatomic, readonly) NSString* fullName;
@property (nonatomic, readonly) NSMutableArray* employees;//служащие

@end

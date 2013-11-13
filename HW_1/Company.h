//
//  Company.h
//  HW_1
//
//  Created by Alexandr on 13.11.13.
//  Copyright (c) 2013 Alex Gra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject

- (id)initWithEmployees:(NSArray*)employees;
@property (nonatomic, readonly) NSMutableArray* employees;
@property (nonatomic, readonly) int totalEmployeesCount;
@property (nonatomic, readonly) int averageEmployeesAge; //округляем

@end

//
//  HW_1Tests.m
//  HW_1Tests
//
//  Created by Alexandr on 13.11.13.
//  Copyright (c) 2013 Alex Gra. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Company.h"
#import "Person.h"

@interface HW_1Tests : XCTestCase
@end

@implementation HW_1Tests

- (void)testPerson
{
    Person* person = [Person alloc];
    [self isImplementedSelector:@selector(initWithFirsName:lastName:) inObject:person];
    person = [person initWithFirsName:@"Andrey" lastName:@"Sidorov"];
    [self isImplementedSelector:@selector(fullName) inObject:person];
    XCTAssertEqualObjects(person.fullName, @"Andrey Sidorov", @"Person: Wrong implementation [person fullName]");
    
    [self isImplementedSelector:@selector(employees) inObject:person];
    
    if(![person.employees isKindOfClass:[NSMutableArray class]]){
        XCTFail(@"[person employees] must be NSMutableArray class. Now it's %@ class", NSStringFromClass([person.employees class]));
        return;
    }
}

- (void)testIsCompanyImplemented
{
    Company* myCompany = [Company alloc];
    [self isImplementedSelector:@selector(initWithEmployees:) inObject:myCompany];
    [self isImplementedSelector:@selector(totalEmployeesCount) inObject:myCompany];
    [self isImplementedSelector:@selector(averageEmployeesAge) inObject:myCompany];
    [self isImplementedSelector:@selector(employees) inObject:myCompany];
    [self isImplementedSelector:@selector(initWithEmployees:) inObject:myCompany];
}

- (void)testCompanyImplementation
{
    Company* myCompany = [Company alloc];
    if(![myCompany respondsToSelector:@selector(initWithEmployees:)])
        return;
    myCompany = [myCompany initWithEmployees:@[]];
    
    if(![myCompany.employees isKindOfClass:[NSMutableArray class]]){
        XCTFail(@"[company employees] must be NSMutableArray class. Now it's %@ class", NSStringFromClass([myCompany.employees class]));
        return;
    }
    if(![[Person alloc] respondsToSelector:@selector(initWithFirsName:lastName:)])
        return;
    
    Person* pers1 = [[Person alloc] initWithFirsName:@"Andrew" lastName:@"No last name"];
    pers1.age = 25;
    Person* pers2 = [[Person alloc] initWithFirsName:@"Andrew" lastName:@"No last name"];
    pers2.age = 26;
    Person* pers3 = [[Person alloc] initWithFirsName:@"Andrew" lastName:@"No last name"];
    pers3.age = 26;
    [pers1.employees addObjectsFromArray:@[pers2, pers3]];
    Person* pers4 = [[Person alloc] initWithFirsName:@"Andrew" lastName:@"No last name"];
    pers4.age = 26;
    Person* pers5 = [[Person alloc] initWithFirsName:@"Andrew" lastName:@"No last name"];
    pers5.age = 25;
    [pers4.employees addObject:pers5];
    Person* pers6 = [[Person alloc] initWithFirsName:@"Andrew" lastName:@"No last name"];
    pers6.age = 14;
    [pers5.employees addObject:pers6];
    
    [myCompany.employees addObjectsFromArray:@[pers1, pers4]];
    if([myCompany respondsToSelector:@selector(averageEmployeesAge)])
        XCTAssertEqual(myCompany.averageEmployeesAge, 24, @"Not correct implementation for [company averageEmployeesAge]");
    if([myCompany respondsToSelector:@selector(totalEmployeesCount)])
        XCTAssertEqual(myCompany.totalEmployeesCount, 6, @"Not correct implementation for [company totalEmployeesCount]");
}
         
- (BOOL)isImplementedSelector:(SEL)selector inObject:(NSObject*)obj
{
    if(![obj respondsToSelector:selector]){
        XCTFail(@"[%@ %@] not implementated", NSStringFromClass([obj class]), NSStringFromSelector(selector));
        return NO;
    }
    return YES;
}

@end

//
//  KiwiUnitTest.m
//  KiwiUnitTest
//
//  Created by Alexander on 26.02.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "Kiwi.h"
#import "MYNotificationCenter.h"
#import "TestObj.h"

SPEC_BEGIN(NotificationTest)


describe(@"Single obj", ^{
    __block TestObj *obj;
    beforeEach(^{
        obj = [TestObj new];
    });
    afterEach(^{
        obj = nil;
    });
    
    it(@"Register and post notification", ^{
        [[MYNotificationCenter sharedInstance] registerObject:obj selector:@selector(method1) notificationName:@"m1"];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m1"];
        [[theValue(obj.method1CallCount) should] equal:theValue(1)];
    });

    it(@"Register twise and post notification", ^{
        [[MYNotificationCenter sharedInstance] registerObject:obj selector:@selector(method1) notificationName:@"m1"];
        [[MYNotificationCenter sharedInstance] registerObject:obj selector:@selector(method1) notificationName:@"m1"];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m1"];
        [[theValue(obj.method1CallCount) should] equal:theValue(1)];
    });

    it(@"Unregister method", ^{
        [[MYNotificationCenter sharedInstance] registerObject:obj selector:@selector(method1) notificationName:@"m1"];
        [[MYNotificationCenter sharedInstance] registerObject:obj selector:@selector(method1) notificationName:@"m2"];
        [[MYNotificationCenter sharedInstance] unregisterObject:obj notificationName:@"m2"];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m1"];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m2"];
        [[theValue(obj.method1CallCount) should] equal:theValue(1)];
        [[theValue(obj.method2CallCount) should] equal:theValue(0)];
    });

    it(@"Unregister object", ^{
        [[MYNotificationCenter sharedInstance] registerObject:obj selector:@selector(method1) notificationName:@"m1"];
        [[MYNotificationCenter sharedInstance] registerObject:obj selector:@selector(method1) notificationName:@"m2"];
        [[MYNotificationCenter sharedInstance] unregisterObject:obj];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m1"];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m2"];
        [[theValue(obj.method1CallCount) should] equal:theValue(0)];
        [[theValue(obj.method2CallCount) should] equal:theValue(0)];
    });
});

describe(@"Bunch objects", ^{
    __block TestObj *obj1;
    __block TestObj *obj2;
    beforeEach(^{
        obj1 = [TestObj new];
        obj2 = [TestObj new];
    });
    afterEach(^{
        obj1 = nil;
        obj2 = nil;
    });
    
    it(@"Register and post notification", ^{
        [[MYNotificationCenter sharedInstance] registerObject:obj1 selector:@selector(method1) notificationName:@"m1"];
        [[MYNotificationCenter sharedInstance] registerObject:obj2 selector:@selector(method1) notificationName:@"m1"];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m1"];
        [[theValue(obj1.method1CallCount) should] equal:theValue(1)];
        [[theValue(obj2.method1CallCount) should] equal:theValue(1)];
    });
    
    it(@"Unregister method", ^{
        [[MYNotificationCenter sharedInstance] registerObject:obj1 selector:@selector(method1) notificationName:@"m1"];
        [[MYNotificationCenter sharedInstance] registerObject:obj1 selector:@selector(method2) notificationName:@"m2"];
        [[MYNotificationCenter sharedInstance] registerObject:obj2 selector:@selector(method1) notificationName:@"m2"];
        [[MYNotificationCenter sharedInstance] unregisterObject:obj1];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m1"];
        [[MYNotificationCenter sharedInstance] postNotificationWithName:@"m2"];
        [[theValue(obj1.method1CallCount) should] equal:theValue(0)];
        [[theValue(obj1.method2CallCount) should] equal:theValue(0)];
        [[theValue(obj2.method1CallCount) should] equal:theValue(1)];
    });
});

// можете добавить свои тесты

SPEC_END

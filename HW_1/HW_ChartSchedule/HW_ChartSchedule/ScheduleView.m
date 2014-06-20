//
//  ScheduleView.m
//  HW_ChartSchedule
//
//  Created by Alexander on 13.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ScheduleView.h"

@implementation ScheduleView

// количество элементов может менятся, ваша задача раcположить их равномерно
- (id)initWithData:(NSArray*)values
{
 self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    
       // example
       //CGRect frame = CGRectMake(0, 0, 100, 100);
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
       UIView *left = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 30, 95)]; //поле с числами
       left.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin; //числа
    UIView *main= [[UIView alloc] initWithFrame:CGRectMake(40, 5, 55, 90)];
    main.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    UIView *back =[[UIView alloc] initWithFrame:CGRectMake(10, 5, 30, 85)];
//    back.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
       for (int i=0; i<5; i++)
       {
           UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20*(4-i), 30, 15)];
           label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
           //NSString *percent = @"rwtg";
           [label setText:[NSString stringWithFormat:@"%d", i*25]];            
           [left addSubview:label];
           if (i==4)
           {
               label.autoresizingMask = UIViewAnimationTransitionNone;
           }
       }
    [self addSubview:left];

    size_t width = 30/(values.count+1);
    for (int i = 0; i<values.count; i++){
               int val = [[values objectAtIndex:i]integerValue];
  
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake((i+1)*width+12, 91-val*0.91, 7, val*0.90)];
    line.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [line setBackgroundColor:[UIColor colorWithRed:0.700 green:0.869 blue:1.0 alpha:1]];
        [main setBackgroundColor:[UIColor whiteColor]];
    [main addSubview:line];
    [self addSubview:main];
    }


    return self;
}




@end





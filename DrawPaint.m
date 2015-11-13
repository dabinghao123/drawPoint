//
//  DrawPaint.m
//  drawPoint
//
//  Created by binghuang on 15/11/2.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "DrawPaint.h"

@implementation DrawPaint



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 20.0);
//    CGContextSetStrokeColorWithColor(context,
//                                     [UIColor blueColor].CGColor);
//  
//    CGContextSaveGState(context);
//    CGFloat dashArray[] = {2,6,4,2};
//    //绘制2个点 II------IIII--II------IIII--II
//    CGContextSetLineDash(context, 3, dashArray, 4);
//    CGContextMoveToPoint(context, 10, 200);
//    
//    // a(10.200) control pointln(150,10)  c(300,200)
//    //贝塞尔曲线
//    CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
//    
//    CGContextStrokePath(context);
//    
//    CGContextRestoreGState(context);
//    
//    CGContextSetStrokeColorWithColor(context,[UIColor redColor].CGColor);
//    
//    CGContextStrokeEllipseInRect(context,CGRectMake(10-5, 200 -5,10,10));
//    CGContextStrokeEllipseInRect(context,CGRectMake(150-5, 10 -5,10,10));
//    CGContextStrokeEllipseInRect(context,CGRectMake(300-5, 200 -5,10,10));

//
//    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGSize  myShadowOffset = CGSizeMake (-10,  15);
    
    CGContextSaveGState(context);
    
    CGContextSetShadow (context, myShadowOffset, 5);
    CGContextSetShadowWithColor(context,myShadowOffset,5,[UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context,[UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(60,170,200,80);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
}

@end

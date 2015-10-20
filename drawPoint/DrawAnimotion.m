//
//  DrawAnimotion.m
//  drawPoint
//
//  Created by binghuang on 15/10/2.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "DrawAnimotion.h"

@implementation DrawAnimotion

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //// PaintCode Trial Version
    //// www.paintcodeapp.com
    
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0.521 green: 0.521 blue: 0.521 alpha: 1];
    
    //// Page-1
    {
        //// Artboard-1
        {
            //// Path-1 Drawing
            UIBezierPath* path1Path = [UIBezierPath bezierPath];
            [path1Path moveToPoint: CGPointMake(23.54, 28.8)];
            [path1Path addLineToPoint: CGPointMake(38.95, 28.8)];
            [path1Path addCurveToPoint: CGPointMake(50.25, 22.64) controlPoint1: CGPointMake(38.95, 28.8) controlPoint2: CGPointMake(50.49, 28.24)];
            [path1Path addCurveToPoint: CGPointMake(46.65, 7.86) controlPoint1: CGPointMake(50.1, 19.1) controlPoint2: CGPointMake(50.79, 11.64)];
            [path1Path addCurveToPoint: CGPointMake(38.95, 1.71) controlPoint1: CGPointMake(42.25, 3.85) controlPoint2: CGPointMake(41.16, 2.61)];
            [path1Path addCurveToPoint: CGPointMake(30.73, 0.47) controlPoint1: CGPointMake(36.96, 0.9) controlPoint2: CGPointMake(34.37, 0.27)];
            [path1Path addCurveToPoint: CGPointMake(23.54, 1.71) controlPoint1: CGPointMake(28.61, 0.6) controlPoint2: CGPointMake(25.63, 1.18)];
            [path1Path addCurveToPoint: CGPointMake(30.73, 48.5) controlPoint1: CGPointMake(13.88, 4.14) controlPoint2: CGPointMake(-15.03, 48.5)];
            [path1Path addCurveToPoint: CGPointMake(46.65, 8.48) controlPoint1: CGPointMake(76.49, 48.5) controlPoint2: CGPointMake(50.21, 8.48)];
            path1Path.miterLimit = 4;
            
            path1Path.usesEvenOddFillRule = YES;
            
            [strokeColor setStroke];
            path1Path.lineWidth = 1;
            [path1Path stroke];
        }
    }

    
}


@end

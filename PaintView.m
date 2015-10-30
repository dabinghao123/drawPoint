//
//  PaintView.m
//  drawPoint
//
//  Created by binghuang on 15/10/29.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "PaintView.h"

@implementation PaintView



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    CGRect myFrame = CGRectMake(0, 0, 100, 100);
    
    CGContextSetLineWidth(context, 2);
    
    CGRectInset(myFrame,10, 10);
    
    [[UIColor redColor] set];
    
    UIRectFrame(myFrame);//drawPaint
    
    [[UIColor yellowColor] set];
    
    CGContextSetLineWidth(context, 1);
    
    UIRectFrame(myFrame);

}

@end

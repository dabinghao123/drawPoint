
//
//  DrawProesss.m
//  drawPoint
//
//  Created by binghuang on 15/10/15.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "DrawProesss.h"


@implementation DrawProesss


/**
 *
 *
 *  @param frame
 *
 *  @return 
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer  * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClick:)];
        
        tapGes.numberOfTapsRequired = 1;
        tapGes.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:tapGes];
        
        
    }
    return self;
}



-(void)onClick:(UITapGestureRecognizer * ) tap{
    
    CGPoint point = [tap locationInView:self];
    
    float value = point.x/CGRectGetWidth(self.frame);
    
    self.value = value;
    
    [self setNeedsDisplay];
    
    
    
    
    
    
}

/**
 *
 - (void)drawRect:(CGRect)rect {
 CGContextRef c = UIGraphicsGetCurrentContext();
 [[UIColor whiteColor] set];
 CGFloat ins = 2.0;
 CGRect r = CGRectInset(self.bounds, ins, ins);
 CGFloat radius = r.size.height / 2.0;
 CGMutablePathRef path = CGPathCreateMutable();
 CGPathMoveToPoint(path, nil, CGRectGetMaxX(r)-radius, ins);
 CGPathAddArc(path, nil,
 radius+ins, radius+ins, radius, -M_PI/2.0, M_PI/2.0, true);
 CGPathAddArc(path, nil,
 CGRectGetMaxX(r)-radius, radius+ins, radius,
 M_PI/2.0, -M_PI/2.0, true);
 CGPathCloseSubpath(path);
 CGContextAddPath(c, path);
 CGContextSetLineWidth(c, 2);
 CGContextStrokePath(c);
 CGContextAddPath(c, path);
 CGContextClip(c);
 CGContextFillRect(c, CGRectMake(
 r.origin.x, r.origin.y, r.size.width * self.value, r.size.height));
 }
 *
 *  @return
 */
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    //每次画先清除
//    CGContextClearRect(c, rect);连背景色都去掉了
    [[UIColor whiteColor] setStroke];
    [[UIColor whiteColor] setFill];
    
    
    CGFloat ins = 2.0;
    
    CGRect r = CGRectInset(self.bounds, ins, ins);
    
    CGFloat radius = r.size.height / 2.0;
    
    CGMutablePathRef path = CGPathCreateMutable();
//    CGContextCopyPath(c);
    
    /**
     CG_EXTERN void CGPathMoveToPoint(CGMutablePathRef __nullable path,
     const CGAffineTransform * __nullable m, CGFloat x, CGFloat y)
     CG_AVAILABLE_STARTING(__MAC_10_2, __IPHONE_2_0);
     *  @return return value description
     */
    
    //
    CGPathMoveToPoint(path, nil, CGRectGetMaxX(r)-radius, ins);//x,y
    
     /*
      CGPathAddArc(CGMutablePathRef __nullable path,
      const CGAffineTransform * __nullable m,
      CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle,
      bool clockwise)
      */
    
    //左圆弧
    CGPathAddArc(path, nil,radius+ins, radius+ins, radius, -M_PI/2.0, M_PI/2.0, true);
    //右圆弧
    CGPathAddArc(path, nil,CGRectGetMaxX(r)-radius, radius+ins, radius,M_PI/2.0, -M_PI/2.0, true);
    
    
    
    CGPathCloseSubpath(path);
    //
    CGContextAddPath(c, path);
    
    CGContextSetLineWidth(c, 1);
    
    CGContextClosePath(c);
    CGContextStrokePath(c);//画在画板上
    




    
//    CGContextDrawPath(co, <#CGPathDrawingMode mode#>)
    
   
     CGContextAddPath(c, path);//添加一个路径
     CGContextClip(c); //裁剪
    
//
//    //画长方形
     CGContextFillRect(c, CGRectMake(r.origin.x, r.origin.y, r.size.width * self.value, r.size.height));
    
}


- (BOOL) beginTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event {
    return YES;
}

@end

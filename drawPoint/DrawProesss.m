
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
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    //每次画先清除
//    CGContextClearRect(c, rect);
    
    
    [[UIColor whiteColor] setStroke];
    [[UIColor whiteColor] setFill];
    
 
    CGFloat ins = 2.0;
    
    CGRect r = CGRectInset(self.bounds, ins, ins);
    
    CGFloat radius = r.size.height / 2.0;
    
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    /**
     
     CG_EXTERN void CGPathMoveToPoint(CGMutablePathRef __nullable path,
     const CGAffineTransform * __nullable m, CGFloat x, CGFloat y)
     CG_AVAILABLE_STARTING(__MAC_10_2, __IPHONE_2_0);
     
     *  @return return value description
     */
    
    CGPathMoveToPoint(path, nil, CGRectGetMaxX(r)-radius, ins);
    
    //左圆弧
    CGPathAddArc(path, nil,radius+ins, radius+ins, radius, -M_PI/2.0, M_PI/2.0, true);
    //右圆弧
    CGPathAddArc(path, nil,CGRectGetMaxX(r)-radius, radius+ins, radius,M_PI/2.0, -M_PI/2.0, true);
    
    CGPathCloseSubpath(path);
    
    
    
    CGContextAddPath(c, path);
    
    CGContextSetLineWidth(c, 1);
    
    CGContextStrokePath(c);

//    CGContextAddPath(c, path);
//    
//    CGContextClip(c);
//    
//    //画长方形
//    CGContextFillRect(c, CGRectMake(r.origin.x, r.origin.y, r.size.width * self.value, r.size.height));

}


- (BOOL) beginTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event {
    return YES;
}

@end

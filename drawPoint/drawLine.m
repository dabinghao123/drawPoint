//
//  drawLine.m
//  drawPoint
//
//  Created by binghuang on 15/10/14.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "drawLine.h"



@interface drawLine(){
    
    CGPoint  beganPoint;
    
    CGPoint  movePoint;
    
    CGPoint  endPoint;
    
    UIBezierPath *path;
}

@end


@implementation drawLine

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        
        path = [UIBezierPath bezierPath];
        [path setLineWidth:2.0];
        
    }
  
    return self;

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    [[UIColor blackColor] setStroke];
    
    [path stroke];
    
//    CGContextRef  context = UIGraphicsGetCurrentContext();
//    //CGContextClearRect(context, rect);
//    
////    cgcontextdr
//
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    
//    
//    CGContextSetFillColorWithColor(context,[UIColor redColor].CGColor );
//    
//    CGContextMoveToPoint(context, beganPoint.x, beganPoint.y);
//    CGContextAddLineToPoint(context, movePoint.x, movePoint.y);
//    
////    CGContextAddEllipseInRect(context, CGRectMake(movePoint.x + 5,movePoint.y + 5, 10, 10));
//    CGContextStrokePath(context);
//    CGContextFillPath(context);
//    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
     beganPoint = [touch locationInView:self];
    
    [path moveToPoint:beganPoint];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p]; // (4)
    
    [self setNeedsDisplay];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        beganPoint  = movePoint;
//
//    });
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    endPoint = [touch locationInView:self];
    
    [super touchesEnded:touches withEvent:event];
    
}



- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
}

@end

//
//  MoveActionView.m
//  drawPoint
//
//  Created by binghuang on 15/11/11.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "MoveActionView.h"


@interface MoveActionView()

@property(nonatomic) CAShapeLayer * catShapeLayer;
@property(nonatomic) CAShapeLayer * mouseShapeLayer;

@end

@implementation MoveActionView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    
//    
//    
//}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self createUI];
        
    }
    return self;
}

-(void)createUI{
    //(__bridge id) self.myImage.CGImage
    
//    UIView * catView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.catShapeLayer = [CAShapeLayer layer];
    
    UIImage * catImage = [UIImage imageNamed:@"指向箭头1"];
    
    self.catShapeLayer.contents =  ((__bridge id)catImage.CGImage);
    
    self.catShapeLayer.frame = CGRectMake(10,50,10,8);
    
//    [self.layer addSublayer:self.catShapeLayer];
    
    
    self.mouseShapeLayer = [CAShapeLayer layer];
    UIImage * mouseImage = [UIImage imageNamed:@"指向箭头2"];
    
    self.mouseShapeLayer.contents = ((__bridge id)mouseImage.CGImage);
    
    self.catShapeLayer.frame = CGRectMake(10, 70, 10, 8);
    
    [self.layer addSublayer:self.mouseShapeLayer];
    
  
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch  = [touches anyObject];
    CGPoint moved = [touch locationInView:self];
    
    
    
    self.mouseShapeLayer.position = moved;
    
    NSLog(@"toucheMoved ====%@",NSStringFromCGPoint(moved));
    NSLog(@"toucheMoved===%@",NSStringFromCGPoint(self.catShapeLayer.position));
    
    CABasicAnimation * baseAni = [CABasicAnimation animationWithKeyPath:@"position"];
    baseAni.fromValue = [NSValue valueWithCGPoint:self.catShapeLayer.position];
    baseAni.toValue   =  [NSValue  valueWithCGPoint:moved];
    baseAni.duration= 4;
//    [baseAni setRemovedOnCompletion:NO];
    baseAni.removedOnCompletion = NO;
    [baseAni setFillMode:kCAFillModeForwards];
    
    
//    baseAni.autoreverses = YES;
    baseAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.mouseShapeLayer addAnimation:baseAni forKey:@"positionMove"];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

@end

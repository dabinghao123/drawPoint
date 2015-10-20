//
//  RotionButton.m
//  drawPoint
//
//  Created by binghuang on 15/10/16.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "RotionButton.h"



@interface RotionButton(){
    
    CGFloat initialAngle;
    
    CGFloat ange;
    
    
}


@end

@implementation RotionButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = CGRectGetWidth(self.frame)/2;
//        UIRotationGestureRecognizer  * rotationGes = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(roTation:)];
//        [self addGestureRecognizer:rotationGes];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage * knob = [UIImage imageNamed:@"switch"];
    
    [knob drawInRect:rect];
    
    
    
    
}


-(void)roTation:(UIRotationGestureRecognizer *) rotaion{
    
    
    NSLog(@"rotation");
    self.transform = CGAffineTransformRotate(self.transform,rotaion.rotation);
    
//    rotaion.rotation = 0;
    
}

static CGFloat pToA (UITouch* touch, UIView* self) {
    
    CGPoint loc = [touch locationInView: self];
    
    CGPoint c = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));
    
    return atan2(loc.y - c.y, loc.x - c.x);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        UITouch  * touch = [touches anyObject];
//       CGPoint start = [touch locationInView:self];
         initialAngle = pToA(touch, self);
    
    

}



-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
       UITouch * touch  = [touches anyObject];
       //CGPoint moved = [touch locationInView:self];
    CGFloat ang = pToA(touch, self);
    
    ang -= initialAngle ;
    
    CGFloat absoluteAngle  = ange +ang;
    
    self.transform = CGAffineTransformRotate(self.transform, ang);
    
     ange = absoluteAngle;
    
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
//    [super touchesEnded:touches withEvent:event];
    
}






@end

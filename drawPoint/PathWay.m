//
//  PathWay.m
//  drawPoint
//
//  Created by binghuang on 15/10/20.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "PathWay.h"

@implementation PathWay


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _pointArray = @[[NSValue valueWithCGPoint:CGPointMake(10, 100)],[NSValue valueWithCGPoint:CGPointMake(10, 200)],[NSValue valueWithCGPoint:CGPointMake(200, 200)]];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    for (int i = 0; i < [_pointArray count]-1; i++) {
        
        CGPoint  startPoint = [_pointArray[i] CGPointValue] ;
        CGPoint  endPoint = [_pointArray[i+1] CGPointValue];
        
        int length = 0;
        int  width = 0;
        int  height = 0;
        int angle = 0;
        
     
        
        length = sqrt(pow((startPoint.x - endPoint.x), 2) + pow((startPoint.y - endPoint.y),2))/20;
        
        float xIndex = (endPoint.x-startPoint.x)/length;
        
        float yIndex = (endPoint.y-startPoint.y)/length;
        
        //判断方向 向右或向右的方向
        if(fabs(startPoint.x - endPoint.x) > fabs(startPoint.y - endPoint.y)){
            
//            向右
            if (startPoint.x < endPoint.x) {
                
                angle = 3;
                
            }else{
                angle = 1;
                
                
            }
            
            width = 10;
            height = 8;
            
            
        //向下或向上
        }else{
            
            if (startPoint.y < endPoint.y) {
                angle = 0;
            }else{
                angle = 2;
            }
            
            width = 8 ;
            height = 10;
        }
        
        //
        for (int i =0; i<length; i++) {
            
            UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"direction%d",angle]];
            [image drawInRect:CGRectMake(startPoint.x + xIndex * i ,startPoint.y + yIndex*i,width,height)];
            
        }
        
        
    }
    
    
     
}


@end

//
//  DashView.m
//  drawPoint
//
//  Created by binghuang on 15/11/11.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "DashView.h"
#import "StyleKitName.h"



@interface DashView()

@end


@implementation DashView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.value = 0.1;
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        self.value = 0.1;
        NSLog(@"initWithCoder");
    }
    return self;
}

-(void)awakeFromNib{
    
    NSLog(@"awakeFromNib");
    
}


-(void)setValue:(CGFloat)value{
    
    if (value >=0 && value <= 100) {
        _value = value;
    }else if (value < 0){
        _value = 0;
    }else if (value > 100){
        _value = 100;
        
    }
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [StyleKitName drawCanvas2WithFrame:CGRectMake(0,0,CGRectGetWidth(rect),300) value:self.value/100.0f];
    
}

- (void)layoutSubviews {
//    UIView *snapshot = [self snapshotViewAfterScreenUpdates:YES];

}



@end

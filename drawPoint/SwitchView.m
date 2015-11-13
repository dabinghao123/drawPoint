//
//  SwitchView.m
//  drawPoint
//
//  Created by binghuang on 15/11/2.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "SwitchView.h"


@interface SwitchView(){
 
    UIView * selectView;
    
    
}

@end

@implementation SwitchView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSUInteger  count = 3;
        CGFloat awidth = CGRectGetWidth(self.frame)/count;
        
        
        for (int i =0 ; i < count; i++) {
            
            UIButton * oneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            oneBtn.frame = CGRectMake(awidth * i+(i*5),0,awidth -5,50);
            oneBtn.tag = 1000 + i;
            [oneBtn setTitle:@"one UIButton" forState:UIControlStateNormal];
            [oneBtn setBackgroundColor:[UIColor grayColor]];
            [oneBtn addTarget:self action:@selector(swithClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:oneBtn];
            
        }
        
//        UIButton * oneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        oneBtn.frame = CGRectMake(0,0,100,50);
//        [oneBtn setTitle:@"one UIButton" forState:UIControlStateNormal];
//        [oneBtn setBackgroundColor:[UIColor grayColor]];
//        [oneBtn addTarget:self action:@selector(swithClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:oneBtn];
//        
//        //two
//        UIButton * twoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        twoBtn.frame = CGRectMake(100,0,100,50);
//        [twoBtn setTitle:@"two UIButton" forState:UIControlStateNormal];
//        [twoBtn setBackgroundColor:[UIColor grayColor]];
//        [twoBtn addTarget:self action:@selector(swithClick:) forControlEvents:UIControlEventTouchUpInside];
//
//        [self addSubview:twoBtn];
//        
//        //three
//        UIButton * threeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        threeBtn.frame = CGRectMake(200,0,100,50);
//        [threeBtn setTitle:@"three UIButton" forState:UIControlStateNormal];
//        [threeBtn addTarget:self action:@selector(swithClick:) forControlEvents:UIControlEventTouchUpInside];
//
//        [threeBtn setBackgroundColor:[UIColor grayColor]];
//        [self addSubview:threeBtn];
        UIButton  * tmpBtn = (UIButton *)[self viewWithTag:1000];

        selectView = [[UIView alloc]initWithFrame:CGRectMake(0,0,CGRectGetWidth(tmpBtn.frame),2)];
        
        selectView.center = CGPointMake(CGRectGetMidX(tmpBtn.frame),CGRectGetMaxY(tmpBtn.frame) - 1.0f);
        
        selectView.backgroundColor = [UIColor blackColor];
        
        [self addSubview:selectView];
        
        
    }
    
    return self;
}


-(void)swithClick:(UIButton * )sender{
    
    [UIView animateWithDuration:0.5 animations:^{
        
    } completion:^(BOOL finished) {
        selectView.center = CGPointMake(CGRectGetMidX(sender.frame),CGRectGetMaxY(sender.frame) - 5);
    }];
    
    
    
    
    NSLog(@"swithClick ====>Uibutton sender===>");
    
}




@end

//
//  DropDownMenuView.m
//  drawPoint
//
//  Created by binghuang on 15/10/28.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "DropDownMenuView.h"


@interface DropDownMenuView(){
    
    BOOL isOpen;
    int  num;
    UIButton  * menuBtn;
    NSMutableArray  * tmpBtnArray;

    UPStackMenuStackPosition_e stackState;
}

@end
@implementation DropDownMenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//50*50

-(instancetype)initWithFrame:(CGRect)frame stackState:(UPStackMenuStackPosition_e ) astackState{
    
    stackState = astackState;


    
    return [self initWithFrame:frame];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"initFrame");
    self = [super initWithFrame:frame];
    if (self) {
        num = 5;
        tmpBtnArray = [[NSMutableArray alloc] initWithCapacity:0];
         menuBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        if (stackState == UPStackMenuStackPosition_up) {
            menuBtn.frame = CGRectMake(0,CGRectGetHeight(frame) - 50, 50, 50);
            NSLog(@"UPStackMenuStackPosition_up");

        }else if(stackState == UPStackMenuStackPosition_down){
            NSLog(@"UPStackMenuStackPosition_down");
            menuBtn.frame = CGRectMake(0,0, 50, 50);
           
        }
        
        
        [menuBtn addTarget:self action:@selector(Onclick:) forControlEvents:UIControlEventTouchUpInside];
        [menuBtn setTitle:@"1" forState:UIControlStateNormal];
        [menuBtn setBackgroundColor:[UIColor grayColor]];
        [self addSubview:menuBtn];
    }
    return self;
}





-(void)Onclick:(UIButton *) sender{
    isOpen = !isOpen;
    NSLog(@"isOpen====%d",isOpen);
    if (isOpen) {
    
        for (int i = 0; i< num; i++) {
            
            UIButton  * tmpBtn =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
            tmpBtn.tag = 1000 + i;
            [tmpBtn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
            [tmpBtn setBackgroundColor:[UIColor grayColor]];
            
            
            if (stackState == UPStackMenuStackPosition_up) {
                
                tmpBtn.frame = CGRectMake(0,CGRectGetHeight(self.frame) - 50, 50, 50);
                
            }else if (stackState == UPStackMenuStackPosition_down){
                
                tmpBtn.frame = CGRectMake(0,0, 50, 50);
            }
            
            [tmpBtn addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
            [tmpBtnArray addObject:tmpBtn];
            [self addSubview:tmpBtn];
            [self sendSubviewToBack:tmpBtn];
        }
        
        [tmpBtnArray enumerateObjectsUsingBlock:^(UIButton * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIButton * tmpBtn = obj;

            [UIView animateWithDuration:0.5 animations:^{
                
                if (stackState == UPStackMenuStackPosition_up) {
                   
                    tmpBtn.frame = CGRectMake(0,CGRectGetHeight(self.frame)-(50*(idx+1)+(idx + 1)*10), 50, 50);

                }else if (stackState == UPStackMenuStackPosition_down){
                    
                    tmpBtn.frame = CGRectMake(0,50*(idx+1)+(idx + 1)*10, 50, 50);

                }
                
            } completion:^(BOOL finished) {
                
            }];
            
        }];

    }else{
        
        [tmpBtnArray enumerateObjectsUsingBlock:^(UIButton * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton * tmpBtn = obj;

            [UIView animateWithDuration:0.5 animations:^{
                
                if (stackState == UPStackMenuStackPosition_up) {
                    
                    tmpBtn.frame = CGRectMake(0,CGRectGetHeight(self.frame) - 50, 50, 50);
                    
                }else if (stackState == UPStackMenuStackPosition_down){
                    
                   tmpBtn.frame = CGRectMake(0,0, 50, 50);
                }
                
                
            } completion:^(BOOL finished) {
                [tmpBtn removeFromSuperview];
                
            }];

        }];
        
        [tmpBtnArray removeAllObjects];

    }
    
     
    //[self bringSubviewToFront:menuBtn];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    
     //.position=[[anim valueForKey:@"KCBasicAnimationLocation"] CGPointValue];
}

-(void)sendMessage:(UIButton *) sender{

    NSLog(@"onclick other button !");
}



@end

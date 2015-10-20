
//
//  CustomPickView.m
//  drawPoint
//
//  Created by binghuang on 15/10/19.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "CustomPickView.h"



@interface CustomPickView()<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    NSArray * theData;
    
    
}


@end

@implementation CustomPickView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        theData = @[@[@"A",@"B",@"C"],@[@"第一个",@"二",@"三",@"四"],@[@"第二个",@"三",@"四"],@[@"第四个",@"第五个"]];

        UIPickerView  * pickView = [[UIPickerView alloc] initWithFrame:self.bounds];
        
        
        for (int i = 0 ; i< [theData count] -1; i++) {
            
            UIView * oneLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(pickView.frame)/([theData count])*(i+1),(CGRectGetHeight(pickView.frame)- 25)/2, 1, 25)];
            
            oneLine.backgroundColor = [UIColor blackColor];
            
            [pickView addSubview:oneLine];
            
        }
        
        pickView.dataSource = self;
        pickView.delegate = self;
        
        [self addSubview:pickView];
        
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        
        
    }
    return self;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [theData[component] count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    
    return [theData count];
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    
    return theData[component][row];
}

//选中的回调
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"pickerView ====>");
    
}


@end

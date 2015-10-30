//
//  DropDownMenuView.h
//  drawPoint
//
//  Created by binghuang on 15/10/28.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    UPStackMenuStackPosition_up = 0,
    UPStackMenuStackPosition_down
    
} UPStackMenuStackPosition_e;

@interface DropDownMenuView : UIView

-(instancetype)initWithFrame:(CGRect)frame stackState:(UPStackMenuStackPosition_e ) astackState;


@end

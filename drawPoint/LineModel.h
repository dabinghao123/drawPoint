//
//  LineModel.h
//  drawPoint
//
//  Created by binghuang on 15/10/12.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



typedef  NS_ENUM(NSInteger,YFColor){
    YF_RED,
    YF_YELLOW,
    YF_BLUE,
    YF_BLACK
    
};


//typedef NS_ENUM(NSInteger,YFSTATUS){
//    YF_STATUS_NORMAL,
//    YF_STATUS_SUCESS,
//    YF_STATUS_NORMAL
//    
//    
//    
//};

@interface LineModel : NSObject<NSCopying>


@property(nonatomic,assign) CGPoint  startPoint;

@property(nonatomic,assign) CGPoint  endPoint;

@property(nonatomic,assign) YFColor  linecolor;

@property(nonatomic,assign) int   status;

//-(id)copyWithZone:(NSZone *)zone;

@end

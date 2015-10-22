//
//  YFPoint.m
//  drawPoint
//
//  Created by binghuang on 15/10/21.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "YFPoint.h"

@implementation YFPoint



-(instancetype)initWithX:(NSNumber *)x Y:(NSNumber *)Y{
    
    if (self = [super init]) {
      
        _x = x;
        _y = Y;
        
    }
    
    
    return  self;
    
}

@end

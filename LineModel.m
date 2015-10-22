//
//  LineModel.m
//  drawPoint
//
//  Created by binghuang on 15/10/21.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "LineModel.h"

@implementation LineModel


-(BOOL)equalsModel:(LineModel *) lineModel{
    
    
    if ([self.starPoint.x isEqualToNumber:lineModel.starPoint.x ] && [self.starPoint.y isEqualToNumber:lineModel.starPoint.y] && [self.endPoint.x isEqualToNumber:lineModel.endPoint.x ] && [self.endPoint.y isEqualToNumber:lineModel.endPoint.y]) {
        
        return YES;
    }
    
    return NO;
    
}

@end

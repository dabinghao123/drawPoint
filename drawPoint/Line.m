//
//  LineModel.m
//  drawPoint
//
//  Created by binghuang on 15/10/12.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "Line.h"

@implementation Line




- (id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] allocWithZone:zone]init];
    
    if (copy)
    {
        [copy setStartPoint:_startPoint];
        [copy setEndPoint:_endPoint];
        [copy setLinecolor:_linecolor];
        [copy setStatus:_status];
        
    }
    
    return copy;
}

@end

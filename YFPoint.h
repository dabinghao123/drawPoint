//
//  YFPoint.h
//  drawPoint
//
//  Created by binghuang on 15/10/21.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFPoint : NSObject

@property(nonatomic,strong) NSNumber * x;
@property(nonatomic,strong) NSNumber * y;

-(instancetype)initWithX:(NSNumber *)x Y:(NSNumber *)Y;
-(BOOL)isEqualOther:(YFPoint*)object;
@end

//
//  LineModel.h
//  drawPoint
//
//  Created by binghuang on 15/10/21.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YFPoint.h"


@interface LineModel : NSObject

@property(nonatomic,strong) YFPoint * starPoint;
@property(nonatomic,strong) YFPoint * endPoint;

-(BOOL)equalsModel:(LineModel *) lineModel;

@end

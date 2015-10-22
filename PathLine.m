
//
//  PathLine.m
//  drawPoint
//
//  Created by binghuang on 15/10/20.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "PathLine.h"
#import "LineModel.h"
#import "YFPoint.h"
#import "PreElement.h"


@interface PathLine (){
  
    NSMutableArray * lineModelsArray;
    NSMutableArray * pointsArray;
    
    NSMutableArray * martinDataArray1;
    

}

@end
@implementation PathLine



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        lineModelsArray  = [[NSMutableArray alloc] initWithCapacity:0];
        pointsArray      = [[NSMutableArray alloc] initWithCapacity:0];
        
        martinDataArray1 = [[NSMutableArray alloc] initWithCapacity:0];
        
        [self collectionData];
     
    }
    return self;
}


-(void)collectionData{
    
    NSDictionary * dict =  [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"line.json" ofType:@""] ] options:NSJSONReadingMutableContainers error:NULL];
    
    NSArray * linesArray     =  [dict objectForKey:@"lines"];
    NSArray * positionsArray =  [dict objectForKey:@"positions"];
    NSArray * matrixArray    =  [dict objectForKey:@"matrix"];
    
    
    for (int i = 0; i< [linesArray count]; i++) {
        
        NSDictionary *  rootDict = linesArray[i];
        NSDictionary * endPointOne = [rootDict objectForKey:@"endPointOne"];
        NSDictionary * endPointTwo = [rootDict objectForKey:@"endPointTwo"];
        
        YFPoint *  startpoint = [[YFPoint alloc]init];
        startpoint.x = [endPointOne objectForKey:@"x"];
        startpoint.y = [endPointOne objectForKey:@"y"];
        
        YFPoint * endPoint = [[YFPoint alloc] init];
        endPoint.x = [endPointTwo objectForKey:@"x"];
        endPoint.y = [endPointTwo objectForKey:@"y"];
        
        LineModel * lineModel = [[LineModel alloc] init];
        lineModel.starPoint = startpoint;
        lineModel.endPoint  = endPoint;
        
        [lineModelsArray addObject:lineModel];
        
    }
    
    for (int i=0; i< [positionsArray count]; i++) {
        NSDictionary * pointDic = positionsArray[i];
        
        YFPoint *  point = [[YFPoint alloc]init];
        point.x = [pointDic objectForKey:@"x"];
        point.y = [pointDic objectForKey:@"y"];
        
        [pointsArray addObject:point];
        
    }
    
    for (int i=0; i< [matrixArray count]; i++) {
        
        NSArray * two = matrixArray[i];
        NSMutableArray * tmpArray  = [[NSMutableArray alloc] initWithCapacity:0];
        for (int j=0; j<[two count]; j++) {
            
            NSDictionary * preElementDic = two[j];
                        
            PreElement * preElement = [[PreElement alloc] init];

            preElement.legnth   =  [preElementDic objectForKey:@"length"];
            preElement.preIndex =  [preElementDic objectForKey:@"proIndex"];
            
          
            [tmpArray addObject: preElement];
        }
        
        [martinDataArray1 addObject:tmpArray];
    }
    

}



-(NSArray *)getPathWay:(YFPoint *)startPoint endPoint:(YFPoint *) endPoint{
 
   
    LineModel * lineOne  = [self getShortLine:startPoint];
    
    LineModel * lineTwo  = [self getShortLine:endPoint];
    
    //如果在通一条直线上就直接连起来
    if ([lineOne equalsModel:lineTwo]) {
        
        NSArray * points = @[startPoint,endPoint];
        
        return points;
    }
    
    //获取lineOne上的点
//     YFPoint * point = 
    
    NSInteger index1  =  [self getShortPoint:lineOne point:startPoint];
    NSInteger index2  =  [self getShortPoint:lineTwo point:endPoint];
    
    
    NSArray  *  pathPoint =  [self getLinePoint:index1 index2:index2];
    
    return pathPoint;
}


//取点

-(NSArray *)getLinePoint:(NSInteger)index1 index2:(NSInteger)index2{
    
    NSMutableArray * pointArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    YFPoint * startPoint = pointsArray[index1];
     YFPoint * endPoint   = pointsArray[index2];
    
     [pointArray addObject:endPoint];
     PreElement  *  preelement = martinDataArray1[index1][index2];
    
    NSLog(@"preelement.preIndex====%ld====%ld",index1,index2);


    while (true) {
        
        preelement = martinDataArray1[index1][[preelement.preIndex intValue]];
        NSLog(@"preelement.preIndex====%@",preelement.preIndex);
        
        NSLog(@"preelement.length==%@",preelement.legnth);
        if ([preelement.legnth intValue] == 0) {
            break;
        }
        
        NSLog(@"尼玛咋么那么难==%@",preelement.preIndex);
        
      
        
        YFPoint * point  = pointsArray[[preelement.preIndex intValue]];
        [pointArray addObject:point];

    }
    
    [pointArray addObject:startPoint];
    
    NSLog(@"🈹getLInePoint ===%ld",[pointArray count]);
    
    
    return [[pointArray reverseObjectEnumerator] allObjects];
    
}


//获取最短线的索引值
-(NSInteger) getShortPoint:(LineModel *) linemodel point:(YFPoint *)point{
    
    double  length1 = 0.0;
    double  length2 = 0.0;
    NSInteger  indenx;
    
    length1 =sqrt(pow(([linemodel.starPoint.x doubleValue]- [point.x doubleValue]), 2) + pow(([linemodel.starPoint.y doubleValue]- [point.y doubleValue]), 2));
        
    length2 =sqrt(pow(([linemodel.endPoint.x doubleValue]- [point.x doubleValue]), 2) + pow(([linemodel.endPoint.y doubleValue]- [point.y doubleValue]), 2));
    
    if (length1 < length2) {
        
        for (int i = 0; i < [pointsArray count]; i++) {
            
            YFPoint * tmpPoint = pointsArray[i];
            
            if ([tmpPoint.x isEqualToNumber:linemodel.starPoint.x]&&[tmpPoint.y isEqualToNumber:linemodel.starPoint.y]) {
                
                indenx = i;
                
                break;
                
            }

        }
        
    }else{
        
        for (int i = 0; i < [pointsArray count]; i++) {
            
            YFPoint * tmpPoint = pointsArray[i];
            
            if ([tmpPoint.x isEqualToNumber:linemodel.endPoint.x]&&[tmpPoint.y isEqualToNumber:linemodel.endPoint.y]) {
                
                indenx = i;
                
                break;
                
            }

        }
        
    }
    
    return indenx;
}



-(LineModel *)getShortLine:(YFPoint *) point{
    
    double length = MAXFLOAT;
    double tmplenth = 0.0;
    
    LineModel * tmpModel;
     //获取最近的线
    for (int i = 0; i< [lineModelsArray count]; i++) {
        LineModel * lineModel = lineModelsArray[i];
        tmplenth = [self getShortLineLength:lineModel.starPoint endPoint:lineModel.endPoint myPoint:point];
        if (length > tmplenth) {
            length = tmplenth;
            tmpModel = lineModel;
         }
        
    }

    return  tmpModel;
}


-(double) getShortLineLength:(YFPoint *)startPoint endPoint:(YFPoint *)endPoint myPoint:(YFPoint*)mypoint{
    
    double x1, y1, x2, y2, x3, y3;
    
    x1 = [mypoint.x doubleValue];
    y1 = [mypoint.y doubleValue];
    
    x2 = [startPoint.x doubleValue];
    y2 = [startPoint.y doubleValue];
    
    x3 = [endPoint.x doubleValue];
    y3 = [endPoint.y doubleValue];
    
    double px = x2 - x1;
    double py = y2 - y1;
    double som = px * px + py * py;
    double u =  ((x3 - x1) * px + (y3 - y1) * py) / som;
    if (u > 1) {
        u = 1;
    }
    if (u < 0) {
        u = 0;
    }
    //the closest point
    double x = x1 + u * px;
    double y = y1 + u * py;
    double dx = x - x3;
    double dy = y - y3;
    double dist = sqrt(dx*dx + dy*dy);
    
    return dist;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
    CGContextSetRGBStrokeColor(context, 1, 0, 1.0, 1.0);//设置线的颜色
    
    YFPoint * startpoint = [[YFPoint alloc]initWithX:[NSNumber numberWithFloat:108.f] Y:[NSNumber numberWithFloat:108.f]];
    
    YFPoint * endpoint  = [[YFPoint alloc] initWithX:[NSNumber numberWithFloat:68.f] Y:[NSNumber numberWithFloat:133.f]];
    
    NSArray * pointArrayTMp = [self getPathWay:startpoint endPoint:endpoint];
    
    NSLog(@"pointArratTmp===%ld",[pointArrayTMp count]);
    
    NSLog(@"pointArratmp====%@",((YFPoint *)pointArrayTMp[0]).x);
    
    YFPoint * tmpPoint = pointArrayTMp[0];
    
    CGContextMoveToPoint(context,[tmpPoint.x doubleValue],[tmpPoint.y doubleValue]);

    for (int i = 0; i< [pointArrayTMp count]; i++) {
//        YFPoint * tmpPoint = pointArrayTMp[i];
        YFPoint * netPoint = pointArrayTMp[i];
          NSLog(@"======mpPoint==%@===%@",netPoint.x,netPoint.y);
        CGContextAddLineToPoint(context,[netPoint.x doubleValue],[netPoint.y doubleValue]);
        CGContextSetLineWidth(context, 2);
        CGContextStrokePath(context);

//        CGContextClosePath(context);
 
    }
    
//    for (int i = 0; i< [linesArray count]; i++) {
//        NSDictionary *  rootDict = linesArray[i];
//        NSDictionary * endPointOne = [rootDict objectForKey:@"endPointOne"];
//        NSDictionary * endPointTwo = [rootDict objectForKey:@"endPointTwo"];
//        
//        CGPoint startPoint = CGPointMake([[endPointOne objectForKey:@"x"] floatValue],[[endPointOne objectForKey:@"y"] floatValue]);
//        
//        CGPoint endPoint = CGPointMake([[endPointTwo objectForKey:@"x"] floatValue], [[endPointTwo objectForKey:@"y"] floatValue]);
//        
//        
//        CGContextMoveToPoint(context,startPoint.x,startPoint.y);
//        CGContextAddLineToPoint(context,endPoint.x,endPoint.y);
//        CGContextSetLineWidth(context, 2);
//       
//        CGContextStrokePath(context);
//
//        CGContextAddEllipseInRect(context, CGRectMake(startPoint.x- 5,startPoint.y - 5,10, 10));
//
//        CGContextAddEllipseInRect(context, CGRectMake(endPoint.x- 5,endPoint.y - 5,10, 10));
//
//        CGContextDrawPath(context, kCGPathFill);
//
//    }
//  
//    CGContextSetRGBFillColor (context,  0.22, 0, 0.6, 1.0);//设置填充颜色
//
//    for (int i=0; i<[positionsArray count]; i++) {
//        
//        NSDictionary * pointDic = positionsArray[i];
//        
//        
//        CGContextAddEllipseInRect(context, CGRectMake([[pointDic objectForKey:@"x"] doubleValue] - 2.5,[[pointDic objectForKey:@"y"] doubleValue] - 2.5,5, 5));
//
//    }
//    
//    CGContextDrawPath(context, kCGPathFill);


    
    
    
}


@end

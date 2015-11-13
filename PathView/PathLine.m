
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
        
        //填充数据和解析数据
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


//获取线路的集合点
-(NSArray *)getPathWay:(YFPoint *)originStartPoint endPoint:(YFPoint *) originEndPoint{
 
   
    LineModel * lineOne  = [self getShortLine:originStartPoint];
    
    LineModel * lineTwo  = [self getShortLine:originEndPoint];
    
    
    
    //如果在同一条直线上就直接连起来
    if ([lineOne equalsModel:lineTwo]) {
        NSArray * points = @[originStartPoint,originEndPoint];
        return points;
    }
    
    //最短点的索引值
    NSInteger index1  =  [self getShortPoint:lineOne point:originStartPoint];
    NSInteger index2  =  [self getShortPoint:lineTwo point:originEndPoint];
    
    NSLog(@"=====idnex1==%ld==index2==%ld",index1,index2);
    NSArray  *  pathPoint =  [self getLinePoint:index1 index2:index2];
    
    NSLog(@"pathPoint ====%ld",[pathPoint count]);
    
    YFPoint * projectionPointStart = [self getshortPoint:lineOne originPoint:originStartPoint];
    
    YFPoint * projectionPointEnd = [self getshortPoint:lineTwo originPoint:originEndPoint];
    
    NSMutableArray * arrayPoint = [[NSMutableArray alloc] initWithArray:pathPoint];
 

    if (projectionPointStart == nil) {
        
        
        [arrayPoint insertObject:pointsArray[index1] atIndex:0];
        //投影点在延长线上
        [arrayPoint insertObject:originStartPoint atIndex:0];
        NSLog(@"projectionPointStart == nil");
        
       
        
    }else{
        
        [arrayPoint insertObject:projectionPointStart atIndex:0];

        if (![projectionPointStart isEqualOther:originStartPoint]) {
            [arrayPoint insertObject:originStartPoint atIndex:0];
        }
        
    }
    
    if (projectionPointEnd == nil) {
        
        YFPoint * endPoint = pointsArray[index2];
        
        [arrayPoint insertObject:endPoint atIndex:[arrayPoint count]];
        
        if (![self isInOneLine:lineTwo originPoint:originEndPoint]) {
            //还要，求一个点
            
            
            
            
            
        }
        //投影点再延长线上
        [arrayPoint insertObject:originEndPoint atIndex:[arrayPoint count]];
        NSLog(@"projectionPointEnd == nil");
        
    }else{
        
        [arrayPoint insertObject:projectionPointEnd atIndex:[arrayPoint count]];

        if (![projectionPointEnd isEqualOther:originEndPoint ]) {
            
            [arrayPoint insertObject:originEndPoint atIndex:[arrayPoint count]];
        }

    }
    
    NSLog(@"arrayPoint===%ld",[arrayPoint count]);
    
    for (YFPoint * point in arrayPoint) {
        NSLog(@"点的坐标是====%@=====%@",point.x,point.y);
    }
    return arrayPoint;
}



-(YFPoint *)gettouyingPoint:(YFPoint *) point1 point2:(YFPoint *)point2{
    float x = [point2.x floatValue] - [point1.x floatValue];
    float y = [point2.y floatValue] - [point2.y floatValue];
    
    if (x > 0) {
        
    }
    
    
    
    return nil;
}


-(BOOL)isInOneLine:(LineModel *) lineModel  originPoint:(YFPoint *) originPoint{
    float a = 0.0;
    float b = 0.0;
    
    a = ([originPoint.y floatValue]- [lineModel.starPoint.y floatValue])/([originPoint.x floatValue] - [lineModel.starPoint.x floatValue]);
    b = ([originPoint.y floatValue]- [lineModel.endPoint.y floatValue])/([originPoint.x floatValue] - [lineModel.endPoint.x floatValue]);
    
    if (a == b) {
        
        return YES;
    }

    return NO;
}

/**
 *  点到线的路线
 *
 *  @return
 */
-(YFPoint *)getshortPoint:(LineModel *) line originPoint:(YFPoint *) originPoint{
    
    //test 点到线上
    
    BOOL isLine = NO;
    
    double x1, y1, x2, y2, x3, y3;
    
    x1 = [line.starPoint.x doubleValue];
    y1 = [line.starPoint.y doubleValue];
    
    x2 = [line.endPoint.x doubleValue];
    y2 = [line.endPoint.y doubleValue];
    
    x3 = [originPoint.x doubleValue];
    y3 = [originPoint.y doubleValue];
    
    double px = x2 - x1;
    double py = y2 - y1;
    double som = px * px + py * py;
    
    double u =  ((x3 - x1) * px + (y3 - y1) * py) / som;
    
    if (u > 1) {
        u = 1;
        NSLog(@"oneTest");
        //在线段的延长线上右边或下边
        isLine = YES;
    }
    if (u < 0) {
        u = 0;
        ////在线段的延长线左边上边
        NSLog(@"twoTest");
        isLine = YES;
        
    }
    //the closest point
    double x = x1 + u * px;
    double y = y1 + u * py;
    
    NSLog(@"=====x=%f===%f",x,y);
    
    double dx = x - x3;
    double dy = y - y3;
    double dist = sqrt(dx*dx + dy*dy);
    
    
    
    
    //如果dist等于0这在线段上
    
    NSLog(@"dist=======%f",dist);
    
    if (isLine) {
        //去点A的点
        return nil;
    }else{
        //取x，y
        return [[YFPoint alloc] initWithX:[NSNumber numberWithDouble:x] Y:[NSNumber numberWithDouble:y]];
    }
    
}


//取点
-(NSArray *)getLinePoint:(NSInteger)index1 index2:(NSInteger)index2{
    
    NSMutableArray * pointArray = [[NSMutableArray alloc] initWithCapacity:0];
    
     PreElement  *  preelement = martinDataArray1[index1][index2];
     YFPoint * point1  = pointsArray[[preelement.preIndex intValue]];
       [pointArray addObject:point1];
    
    while (true) {
        
        preelement = martinDataArray1[index1][[preelement.preIndex intValue]];
        
        if ([preelement.legnth intValue] == 0 || [preelement.preIndex intValue] == index1) {
            break;
        }

        YFPoint * point  = pointsArray[[preelement.preIndex intValue]];
     
        [pointArray addObject:point];
        
    }
    
    return [[pointArray reverseObjectEnumerator] allObjects];
    
}


//获取最短点的的索引值
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


//找最短的线
-(double) getShortLineLength:(YFPoint *)startPoint endPoint:(YFPoint *)endPoint myPoint:(YFPoint*)mypoint{
    
    double x1, y1, x2, y2, x3, y3;
    
    x1 = [startPoint.x doubleValue];
    y1 = [startPoint.y doubleValue];
    
    x2 = [endPoint.x doubleValue];
    y2 = [endPoint.y doubleValue];
    
    x3 = [mypoint.x doubleValue];
    y3 = [mypoint.y doubleValue];
    
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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
    CGContextSetRGBStrokeColor(context, 1, 0, 1.0, 1.0);//设置线的颜色
    
    YFPoint * startpoint = [[YFPoint alloc]initWithX:[NSNumber numberWithFloat:68.f] Y:[NSNumber numberWithFloat:83.f]];
    
    YFPoint * endpoint  = [[YFPoint alloc] initWithX:[NSNumber numberWithFloat:108.f] Y:[NSNumber numberWithFloat:133.f]];
    
    NSArray * pointArrayTMp = [self getPathWay:startpoint endPoint:endpoint];
    
    
    
    
     YFPoint * tmpPoint = pointArrayTMp[0];
    
    
    
    
    
    
//    
//    if (pointArrayTMp.count < 1) {
//        
//        return;
//        
//    }
//    
//    for (int i=0 ; i<pointArrayTMp.count -1; i++) {
//        
//        YFPoint * startPoint = pointArrayTMp[i];
//        YFPoint * endPoint = pointArrayTMp[i+1];
//        
//        
//        float x1=[startPoint.x  floatValue];
//        float y1=[startPoint.y  floatValue];
//        
//        float x2=[endPoint.x  floatValue];
//        float y2=[endPoint.y  floatValue];
//        
//        int length = 0;
//        
//        //长度
//        length = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2))/5.0;
//        
//        float xIndex = (x2-x1)/length;
//        
//        float yIndex = (y2-y1)/length;
//        
//        int angle = 0;
//        
//        
//        
//        //大于0 说明是向左或者是向右移动
//        if (fabsf(x1-x2) > fabsf(y1-y2)) {
//            if ((x1-x2)>0) {
//                
//                angle=1;
//                //                向左
//            }else if ((x1-x2)<0){
//                
//                angle = 3;
//                
//            }
//            
//            
//        }else{
//            //向上
//            if ((y1-y2)>0) {
//                angle = 2;
//                //向下
//            }else if ((y1-y2)<0){
//                angle = 0;
//            }
//        }
//        
//        int width = 0;
//        int height = 0;
//        
//        
//        if (angle%2 == 0) {
//            
//            width = 10;
//            height = 8;
//            
//        }else{
//            
//            width = 8;
//            height = 10;
//        }
//        
//        
//        for (int i=0; i<length; i++) {
//            
//            UIImage * image=[UIImage imageNamed:[NSString stringWithFormat:@"指向箭头%d.png",angle]];
//            [image drawInRect:CGRectMake(x1+xIndex*i, y1+yIndex*i, width*0.6,height*0.6)];
//            
//        }
//        
//        
//    }
//    
//    self.alpha=1;
    
    CGContextSetLineWidth(context, 2);
    
    CGContextAddEllipseInRect(context, CGRectMake([tmpPoint.x doubleValue] - 5,[tmpPoint.y doubleValue] - 5,10, 10));
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextMoveToPoint(context,[tmpPoint.x doubleValue],[tmpPoint.y doubleValue]);
    
    //画线
    for (int i = 1; i< [pointArrayTMp count]; i++) {
        YFPoint * netPoint = pointArrayTMp[i];
          NSLog(@"======mpPointx==%@==y=%@",netPoint.x,netPoint.y);
         CGContextAddLineToPoint(context,[netPoint.x doubleValue],[netPoint.y doubleValue]);
    }
      CGContextStrokePath(context);

    
    //画点
    for (int i = 1; i< [pointArrayTMp count]; i++) {
        YFPoint * netPoint = pointArrayTMp[i];
        CGContextAddEllipseInRect(context, CGRectMake([netPoint.x doubleValue] - 5,[netPoint.y doubleValue] - 5,10, 10));
    }
        CGContextDrawPath(context, kCGPathFillStroke);
    

    
}


@end

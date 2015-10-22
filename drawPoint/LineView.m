////
////  LineView.m
////  drawPoint
////
////  Created by binghuang on 15/10/12.
////  Copyright © 2015年 binghuang. All rights reserved.
////
//
//#import "LineView.h"
//#import "Line.h"
//
//
//
//@interface LineView(){
//    
//    YFColor tmpColor;
//    int  tmpIndex;
//    int  markIndex;
//    BOOL isFrist;
//    
//    NSMutableArray * tmpArray;
//}
//
//@end
//
//@implementation LineView
//
//
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//        
//        self.backgroundColor = [UIColor clearColor];
//        
//        UITapGestureRecognizer  * gesClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapAction:)];
//        
//        gesClick.numberOfTapsRequired = 1;
//        gesClick.numberOfTouchesRequired = 1;
//                
//        
//        [self addGestureRecognizer:gesClick];
//        
//    }
//    return self;
//}
//
//
//-(void)setLineArray:(NSMutableArray *)lineArray{
//    
//     tmpArray = [[NSMutableArray alloc] initWithArray:lineArray copyItems:YES];
//    
//    _lineArray = lineArray;
//    
//    NSLog(@"测试");
//    
//   
//    NSLog(@"=====old=dddd====%@",NSStringFromCGPoint(((LineModel *)tmpArray[2]).startPoint));
//    
//}
//
//
//-(void)TapAction:(UITapGestureRecognizer *) ges{
//    
//    CGPoint point = [ges locationInView:self];
//    
//    
//    double tmpDistance = 0.0;
//    double maxDistance = MAXFLOAT;
//   
//    
//    tmpIndex  = markIndex;
//    
//    for (int i = 0 ; i<[_lineArray count]; i++) {
//        
//        LineModel  * lineModel = _lineArray[i];
//    
//        tmpDistance = [self distance:lineModel.startPoint endPoint:lineModel.endPoint tapPoint:point];
//        NSLog(@"tmpDistance==%f",tmpDistance);
//        if (maxDistance > tmpDistance) {
//            maxDistance = tmpDistance;
//            markIndex = i;
//            
//        }
//    }
//    
//    
//    
//    
//    LineModel *  tmpLineModel = _lineArray[[_lineArray count ] -1];
//    
//    
//    if (!isFrist) {
//        
//        isFrist = YES;
//        
//    }else{
//        
//        tmpLineModel.linecolor  = tmpColor;
//        
//    }
//    
//    LineModel  * lineModel = _lineArray[markIndex];
//    
//    //求最短的点。。。。
//    
//    
//   
//  
//    tmpColor = lineModel.linecolor;
//    lineModel.linecolor = YF_YELLOW;
//    
//    [_lineArray exchangeObjectAtIndex:markIndex withObjectAtIndex:[_lineArray count] -1];
//    
//    
//    LineModel * oldlineModel = tmpArray[markIndex];
//    
//    NSLog(@"=====old==i=%ld====%d",(long)oldlineModel.linecolor,markIndex);
//    
//   
//    [self  setNeedsDisplay];
//    
//}
//
//
//-(CGPoint)mindistance:(LineModel *) lienmodel tapPoint:(CGPoint) tapPoint{
//    
////    float line1 =
////    
////    float line
////    
//    
//    
//    return CGPointMake(0, 0);
//}
//
//
////求最短距离
//-(double) distance:(CGPoint) startPoint endPoint:(CGPoint)endPoint tapPoint:(CGPoint) tapPoint{
//    
//    double x1, y1, x2, y2, x3, y3;
//    
//    x1 = startPoint.x;
//    y1 = startPoint.y;
//    
//    
//    x2 = endPoint.x;
//    y2 = endPoint.y;
//    
//    x3 = tapPoint.x;
//    y3 = tapPoint.y;
//    
// 
//    double px = x2 - x1;
//    double py = y2 - y1;
//    
//    double som = px * px + py * py;
//    double u =  ((x3 - x1) * px + (y3 - y1) * py) / som;
//    if (u > 1) {
//        u = 1;
//    }
//    if (u < 0) {
//        u = 0;
//    }
//    //the closest point
//    double x = x1 + u * px;
//    double y = y1 + u * py;
//    double dx = x - x3;
//    double dy = y - y3;
//    
//    double dist = sqrt(dx*dx + dy*dy);
//   
//    return dist;
//    
//    
//}
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
// 
//- (void)drawRect:(CGRect)rect {
//    
//    for (int  i = 0; i<[_lineArray count]; i++) {
////       CAShapeLayer  * layer  = [CAShapeLayer  layer];
//        LineModel * linemodel = _lineArray[i];
//        
//        
////        switch (linemodel.linecolor) {
////            case YF_BLACK:
////                layer.strokeColor = [UIColor blackColor].CGColor;
////                
////                break;
////            case YF_BLUE:
////                layer.strokeColor = [UIColor blueColor].CGColor;
////
////                
////                break;
////            case YF_RED:
////                layer.strokeColor = [UIColor redColor].CGColor;
////
////                break;
////            case YF_YELLOW:
////                layer.strokeColor = [UIColor yellowColor].CGColor;
////
////                break;
////            default:
////                break;
////        }
////        
////          layer.fillColor = [UIColor redColor].CGColor;
////        
////          layer.lineWidth = 1;
////    
////          layer.lineJoin = kCALineJoinRound;
////          layer.lineCap = kCALineCapRound;
////        
//        
//        
//        //// Oval Drawing
////        UIBezierPath* bezierPath = [UIBezierPath bezierPathWithArcCenter:linemodel.startPoint radius:5.f startAngle:0 endAngle:2*M_PI clockwise:YES];;
////        
////     
////        [bezierPath addArcWithCenter:linemodel.endPoint radius:5 startAngle:0 endAngle:2*M_PI clockwise:YES];
////        
////        //// Bezier Drawing
////        [bezierPath moveToPoint: linemodel.startPoint];
////        [bezierPath addLineToPoint:linemodel.endPoint];
////        [UIColor.blackColor setStroke];
////         bezierPath.lineWidth = 1;
////         [bezierPath stroke];
//        
//
////        UIBezierPath * path  = [UIBezierPath bezierPathWithArcCenter:linemodel.startPoint radius:5.f startAngle:0 endAngle:2*M_PI clockwise:NO];
////        
////        [path addArcWithCenter:linemodel.endPoint radius:5 startAngle:0 endAngle:2*M_PI clockwise:NO];
////        
////        [path moveToPoint:linemodel.startPoint];
////        [path addLineToPoint:linemodel.endPoint];
////        
////        
////         path.lineWidth = 2;
////         [path fill];
////         layer.path = bezierPath.CGPath;
//        CGContextRef  context = UIGraphicsGetCurrentContext();
//        
////        CGContextSaveGState(context);
//        
//        
//        switch (linemodel.linecolor) {
//            case YF_BLACK:
////                layer.strokeColor = [UIColor blackColor].CGColor;
//                [[UIColor blackColor] setFill];
//                
//                [[UIColor blackColor] set];
//                
//                break;
//            case YF_BLUE:
////                layer.strokeColor = [UIColor blueColor].CGColor;
//                [[UIColor blueColor] setFill];
//                
//                [[UIColor blueColor] set];
//                
//                break;
//            case YF_RED:
////                layer.strokeColor = [UIColor redColor].CGColor;
//                [[UIColor redColor] setFill];
//                
//                [[UIColor redColor] set];
//                break;
//            case YF_YELLOW:
////                layer.strokeColor = [UIColor yellowColor].CGColor;
//                [[UIColor yellowColor] setFill];
//                
//                [[UIColor yellowColor] set];
//                break;
//            default:
//                break;
//        }
//   
//        
//
//        CGPoint aPoints[2];
//        aPoints[0] = linemodel.startPoint;
//        aPoints[1] = linemodel.endPoint;
//        CGContextMoveToPoint(context, linemodel.startPoint.x, linemodel.startPoint.y);
//        CGContextAddLineToPoint(context,linemodel.endPoint.x, linemodel.endPoint.y);
//        
//        
//        CGContextFillEllipseInRect(context, CGRectMake(linemodel.startPoint.x - 5, linemodel.startPoint.y - 5, 10, 10));
//        
//        //        CGContextAddArc(context, linemodel.startPoint.x,linemodel.startPoint.y, 5, 0, 2*M_PI, YES);
//        CGContextFillEllipseInRect(context, CGRectMake(linemodel.endPoint.x - 5, linemodel.endPoint.y - 5, 10, 10));
//        
//     
////        CGContextAddLines(context,aPoints, 2);
//       
//     
//        
////        CGContextRestoreGState(context);
//        CGContextStrokePath(context);
//        
//        CGContextFillPath(context);
//        
//        //
//        //CGContextClosePath(context);
//
////        [self.layer addSublayer:layer];
//
//    }
//    
//    
//}
//
//
//@end

//
//  ViewController.m
//  drawPoint
//
//  Created by binghuang on 15/10/2.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "ViewController.h"
#import "DrawAnimotion.h"

#import "Line.h"

#import "LineView.h"
#import "DrawProesss.h"

#import "drawLine.h"

#import "RotionButton.h"

#import "CustomPickView.h"
#import "PathWay.h"

#import "PathLine.h"

#import "DropDownMenuView.h"

#import "PaintView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    DrawAnimotion  * drawView = [[DrawAnimotion alloc] initWithFrame:CGRectMake(0, 100,100, 100)];
//    drawView.backgroundColor =[UIColor clearColor];
//    [self.view addSubview:drawView];
    
    //monishuju
    
    int a = 13;
    int  b  = 19;
    
    a^=b;
    b^=a;
    a^=b;
    
    NSLog(@"===%d==%d",a,b);
    
    
    
    //16*9 = 144
    
    //    NSLog(@"===%d",10&3);
  //    NSLog(@"===%d",100|3);
//    NSLog(@"===%d",100>>3);
   //    NSLog(@"===%d",100^3);
    
//    NSLog(@"==BOOL=%lu",sizeof(BOOL));//整形1个字节
//    NSLog(@"==char=%lu",sizeof(char));//整形1个字节
//    NSLog(@"==int=%lu",sizeof(int));//整形1个字节
//    NSLog(@"==float=%lu",sizeof(float));//整形1个字节
//    NSLog(@"==double=%lu",sizeof(double));//整形1个字节
//    NSLog(@"==long long int=%lu",sizeof(long long int));//整形1个字节
//    NSLog(@"==long int=%lu",sizeof(long int));//整形1个字节
//    NSLog(@"==short int=%lu",sizeof(short int));//整形1个字节
//    
//    NSLog(@"== int*=%lu",sizeof(char *));//整形1个字节
//
//    NSLog(@"arc4random====%d",arc4random()%100);
    
//    NSMutableArray  * lineArray = [[NSMutableArray alloc] initWithCapacity:0];
//    
//    LineModel * line1 = [[LineModel alloc] init];
//    
//    line1.startPoint = CGPointMake(20, 20);
//    line1.endPoint   = CGPointMake(100, 20);
//    line1.linecolor  = YF_BLACK;
//    
//    
//    [lineArray addObject:line1];
//    
//    LineModel * line2 = [[LineModel alloc] init];
//    
//    line2.startPoint = CGPointMake(40, 100);
//    line2.endPoint   = CGPointMake(100, 100);
//    line2.linecolor  = YF_BLUE;
//    
//    [lineArray addObject:line2];
//
//    LineModel * line3 = [[LineModel alloc] init];
//    
//    line3.startPoint = CGPointMake(100,100);
//    line3.endPoint   = CGPointMake(200,100);
//    line3.linecolor  = YF_RED;
//    
//    [lineArray addObject:line3];

    
//    LineView * lineview = [[LineView alloc] initWithFrame:CGRectMake(0, 64, 320, 568)];
//    lineview.lineArray = lineArray;
//    
//    
//    LineModel * line4 = [[LineModel alloc] init];
//    line4.startPoint  = CGPointMake(200, 100);
//    line4.endPoint    = CGPointMake(40, 300);
//    line3.linecolor   = YF_BLACK;
//    
//    [lineArray addObject:line4];
//    
   //1.
//    drawLine * draw = [[drawLine alloc] initWithFrame:CGRectMake(0, 64, 320, 568)];
//    lineview.lineArray = lineArray;
//    
//    
//    
//    
//   [self.view addSubview:draw];
    
//2
//    DrawProesss *press = [[DrawProesss alloc] initWithFrame:CGRectMake(100,64,100, 20)];
//    press.value = 0.5;
//    press.backgroundColor = [UIColor grayColor];
//    
//    [self.view addSubview:press];
//    
//3
//    
//    NSArray *array=@[@"搜索",@"选择",@"视频",@"图片"];
//    UISegmentedControl *segmentControl=[[UISegmentedControl alloc]initWithItems:array];
//    //设置位置 大小
//    segmentControl.frame = CGRectMake(60, 100, 200, 40);
//    //默认选择
//    segmentControl.selectedSegmentIndex=1;
    
    //设置背景色
//    segmentControl.tintColor=[UIColor greenColor];
    //设置监听事件
    //[segmentControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
//    
//    [self.view addSubview:segmentControl];
//    
//    
//    
//    
//    
//    // background, set desired height but make width resizable
//    // sufficient to set for Normal only
//    UIImage* image = [UIImage imageNamed: @"linen.png"];
//    CGFloat w = 100;
//    CGFloat h = 60;
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(w,h), NO, 0);
//    [image drawInRect:CGRectMake(0,0,w,h)];
//    UIImage* image2 = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImage* image3 =
//    [image2 resizableImageWithCapInsets:UIEdgeInsetsMake(0,10,0,10)
//                           resizingMode:UIImageResizingModeStretch];
////    [self.seg setBackgroundImage:image3 forState:UIControlStateNormal
////                      barMetrics:UIBarMetricsDefault];
////    
//    // segment images, redraw at final size
//    NSArray* pep = @[@"manny.jpg", @"moe.jpg", @"jack.jpg"];
//    for (int i = 0; i < 3; i++) {
//        UIImage* image = [UIImage imageNamed: pep[i]];
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(30,30), NO, 0);
//        [image drawInRect:CGRectMake(0,0,30,30)];
//        UIImage* image2 = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//       // [self.seg setImage:image2 forSegmentAtIndex:i];
//    }
//    
//    // divider, set at desired width, sufficient to set for Normal only
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1,10), NO, 0);
//    [[UIColor whiteColor] set];
//    
//    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0,0,1,10));
//    
//    UIImage* div = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    [self.seg setDividerImage:div
//          forLeftSegmentState:UIControlStateNormal
//            rightSegmentState:UIControlStateNormal
//                   barMetrics:UIBarMetricsDefault];
//    
//    
//    RotionButton * rotionButton = [[RotionButton alloc] initWithFrame:CGRectMake(0, 64, 100, 100)];
//    [self.view addSubview:rotionButton];
    
//    CustomPickView * customView  = [[CustomPickView alloc] initWithFrame:CGRectMake(0,64,300,100)];
//    customView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:customView];
//    PathWay *pathWay = [[PathWay alloc ] initWithFrame:CGRectMake(0,64,320,568)];
//    [self.view addSubview:pathWay];
    
    //5
//    PathLine  * pathLine = [[PathLine alloc]initWithFrame:CGRectMake(0,64,320,560)];
//    
//    pathLine.backgroundColor = [UIColor whiteColor];
//    
//    [self.view addSubview:pathLine];
//    
    //6
   /*
    UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    activity.color  = [UIColor yellowColor];
    activity.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.4];
    
    CGRect f = activity.bounds;
    f.size.width += 50;
    f.size.height+= 50;
//    f.origin.x += 50;
//    f.origin.y += 50;
    
    activity.frame = f;
    
    NSLog(@"========%@",NSStringFromCGRect(activity.bounds));
    
    [activity startAnimating];
    [self.view addSubview:activity];
    */
    
    //7
    
    /*
    UIProgressView * press = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];

    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(9, 9),NO,0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context,0, 4.5);
    CGContextAddLineToPoint(context, 4.5, 9);
    CGContextAddLineToPoint(context, 9, 4.5);
    CGContextAddLineToPoint(context, 4.5, 0);
    
    CGContextClosePath(context);
    
    CGPathRef p = CGContextCopyPath(context);
    
    CGContextFillPath(context);
    
    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextAddPath(context, p);
    CGContextFillPath(context);
    
    UIImage * im2  = UIGraphicsGetImageFromCurrentImageContext();
    CGPathRelease(p);
    UIGraphicsEndImageContext();
    
    //9*9
    im = [im resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)
                            resizingMode:UIImageResizingModeStretch];
    
    im2 = [im2 resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4) resizingMode:UIImageResizingModeStretch];
    
    press.frame = CGRectMake(0, 64, 100, 100);
    
    press.trackImage = im;
    
    press.progressImage = im2;
    
    press.progress = 0.5;
    
    press.backgroundColor = [UIColor brownColor];
    
//    UIImageView * testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 64,9, 9)];
//    testImageView.image = im;
//    testImageView.backgroundColor = [UIColor grayColor];

    [self.view addSubview:press];
    
    */
    
    //8
    // background, set desired height but make width resizable
    // sufficient to set for Normal only
    
//    UIImage* image = [UIImage imageNamed: @"linen.png"];
//    CGFloat w = 100;
//    CGFloat h = 60;
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(w,h), NO, 0);
//    [image drawInRect:CGRectMake(0,0,w,h)];
//    UIImage* image2 = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImage* image3 =
//    [image2 resizableImageWithCapInsets:UIEdgeInsetsMake(0,10,0,10)
//                           resizingMode:UIImageResizingModeStretch];
//    [self.seg setBackgroundImage:image3 forState:UIControlStateNormal
//                      barMetrics:UIBarMetricsDefault];
//    
//    // segment images, redraw at final size
//    NSArray* pep = @[@"manny.jpg", @"moe.jpg", @"jack.jpg"];
//    for (int i = 0; i < 3; i++) {
//        UIImage* image = [UIImage imageNamed: pep[i]];
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(30,30), NO, 0);
//        [image drawInRect:CGRectMake(0,0,30,30)];
//        UIImage* image2 = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        [self.seg setImage:image2 forSegmentAtIndex:i];
//    }
//    
//    // divider, set at desired width, sufficient to set for Normal only
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1,10), NO, 0);
//    [[UIColor whiteColor] set];
//    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0,0,1,10));
//    UIImage* div = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self.seg setDividerImage:div
//          forLeftSegmentState:UIControlStateNormal
//            rightSegmentState:UIControlStateNormal
//                   barMetrics:UIBarMetricsDefault];
//    
  
    
    //test 点到线上
//    [self getshortPoint];
//    float x = 1;
//    float y = 0;
//    UIView * testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 200)];
//    testView.layer.anchorPoint = CGPointMake(x, y);
//    
//    CGPoint point = CGPointMake(self.view.center.x, self.view.center.y);
//    testView.layer.position    = point;
//    
//    testView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(testView.frame) * (x - 0.5),CGRectGetHeight(testView.frame)*(y - 0.5) );
//    
//    
//    testView.backgroundColor   =[UIColor grayColor];
//    [self.view addSubview:testView];
//    
//    UIView * test  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    test.center = self.view.center;
//    test.layer.cornerRadius = 10;
//
//    test.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:test];
//    
//    UIView * test1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    test1.center = self.view.center;
//    test1.layer.cornerRadius = 10;
//    
//    test1.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(testView.frame) * (0.5 - x ),CGRectGetHeight(testView.frame)*(0.5 - y) );
//
//    test1.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:test1];
    
    
    //test mutablecopy  and copy different
//   
//    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64,100,100)];
//    
//    //开始创建一个
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame)), NO, 0);
//    CGContextRef  context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
//    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
//    CGContextFillEllipseInRect(context, CGRectMake(2, 2, 50, 50));
//    CGContextStrokeEllipseInRect(context,CGRectMake(2, 2, 50, 50));
    
//    DropDownMenuView * menuView = [[DropDownMenuView alloc] initWithFrame:CGRectMake(0,64,50,50*5+ 10*5) stackState:UPStackMenuStackPosition_down];
//    
//    [self.view addSubview:menuView];
    
    PaintView * paintView =  [[PaintView alloc] initWithFrame:CGRectMake(0, 64, 100, 100)];
    
    [self.view addSubview:paintView];
    
}

//static void MyDrawStencilStar (void *info, CGContextRef myContext)
//{
//    int k;
//    double r, theta;
//    double PSIZE = 100;
//    r = 0.8 * PSIZE / 2;
//    theta =  2 * M_PI * (2.0 / 5); // 144 degrees
//    
//    
//    CGContextTranslateCTM (context, PSIZE/2, PSIZE/2);
//    
//    
//    CGContextMoveToPoint(context,0,r);
//    
//    for (k = 1; k < 5; k++) {
//        
//        CGContextAddLineToPoint (context,r * sin(k * theta),r * cos(k * theta));
//        
//    }
//    
//    //    CGContextClosePath(context);
//    //    CGContextFillPath(context);
//    CGContextStrokePath(context);
//    
//    CGContextClip(context);
//    CGContextClosePath(context);
//    
//    
//    CGContextFillRect(context, CGRectMake(-50, -50, 50, 50));
//    
//    CGContextClosePath(context);
//    
//    UIImage *  image =  UIGraphicsGetImageFromCurrentImageContext();
//    //结束
//    UIGraphicsEndImageContext();
//    
//    imageView.image = image;
//    
//    [self.view addSubview:imageView];
//    
//
//}


-(CGPoint)getshortPoint{
    
    //test 点到线上
    
    BOOL isLine = NO;
    
    double x1, y1, x2, y2, x3, y3;
    
    x1 = 50;
    y1 = 50;
    
    x2 = 50;
    y2 = 100;
    
    x3 = 100;
    y3 = 120;
    
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
    
    
//    投影点
    
    
//    double 
    
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
        return CGPointMake(0, 0);
    }else{
      //取x，y
        return CGPointMake(x, y);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

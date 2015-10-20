//
//  ViewController.m
//  drawPoint
//
//  Created by binghuang on 15/10/2.
//  Copyright © 2015年 binghuang. All rights reserved.
//

#import "ViewController.h"
#import "DrawAnimotion.h"

#import "LineModel.h"

#import "LineView.h"
#import "DrawProesss.h"

#import "drawLine.h"

#import "RotionButton.h"

#import "CustomPickView.h"
#import "PathWay.h"


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
    
    NSMutableArray  * lineArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    LineModel * line1 = [[LineModel alloc] init];
    
    line1.startPoint = CGPointMake(20, 20);
    line1.endPoint   = CGPointMake(100, 20);
    line1.linecolor  = YF_BLACK;
    
    
    [lineArray addObject:line1];
    
    LineModel * line2 = [[LineModel alloc] init];
    
    line2.startPoint = CGPointMake(40, 100);
    line2.endPoint   = CGPointMake(100, 100);
    line2.linecolor  = YF_BLUE;
    
    [lineArray addObject:line2];

    LineModel * line3 = [[LineModel alloc] init];
    
    line3.startPoint = CGPointMake(100,100);
    line3.endPoint   = CGPointMake(200,100);
    line3.linecolor  = YF_RED;
    
    [lineArray addObject:line3];

    
    LineView * lineview = [[LineView alloc] initWithFrame:CGRectMake(0, 64, 320, 568)];
    lineview.lineArray = lineArray;
    
    
    LineModel * line4 = [[LineModel alloc] init];
    line4.startPoint  = CGPointMake(200, 100);
    line4.endPoint    = CGPointMake(40, 300);
    line3.linecolor   = YF_BLACK;
    
    [lineArray addObject:line4];
    
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
//    press.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:press];
    
//3
    
    NSArray *array=@[@"搜索",@"选择",@"视频",@"图片"];
    UISegmentedControl *segmentControl=[[UISegmentedControl alloc]initWithItems:array];
    //设置位置 大小
    segmentControl.frame = CGRectMake(60, 100, 200, 40);
    //默认选择
    segmentControl.selectedSegmentIndex=1;
    
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
    PathWay *pathWay = [[PathWay alloc ] initWithFrame:CGRectMake(0,64,320,568)];
    [self.view addSubview:pathWay];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

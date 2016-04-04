//
//  ViewController.m
//  SquaredUp
//
//  Created by  江苏 on 16/4/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#define appViewWith   90
#define appViewHeight 90
#define colCount      3
#define startY        30
    CGFloat marginX=(self.view.bounds.size.width-appViewWith*colCount)/(colCount+1);
    CGFloat marginY=10;
    for (int i=0; i<10; i++) {
        int row=i/colCount;
        int col=i%colCount;
        CGFloat X=marginX+col*(marginX+appViewWith);
        CGFloat Y=startY+row*(marginY+appViewHeight);
        UIView* view=[[UIView alloc]initWithFrame:CGRectMake(X, Y, appViewWith,appViewHeight)];
        view.backgroundColor=[UIColor redColor];
        [self.view addSubview:view];
    }
}
@end

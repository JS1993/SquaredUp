//
//  ViewController.m
//  SquaredUp
//
//  Created by  江苏 on 16/4/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppView.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray* imageList;
@end
#define appViewWith   90
#define appViewHeight 90
#define colCount      3
#define startY        30
@implementation ViewController
-(NSArray *)imageList{
    if (_imageList==nil) {
        _imageList=[AppInfo appList];
    } 
    return _imageList;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat marginX=(self.view.bounds.size.width-appViewWith*colCount)/(colCount+1);
    CGFloat marginY=10;
    for (int i=0; i<self.imageList.count; i++) {
        int row=i/colCount;
        int col=i%colCount;
        CGFloat X=marginX+col*(marginX+appViewWith);
        CGFloat Y=startY+row*(marginY+appViewHeight);
        AppView* view=[AppView initWithAppInfo:self.imageList[i]];
        view.frame=CGRectMake(X, Y, appViewWith,appViewHeight);
        [self.view addSubview:view];
    }
}

@end

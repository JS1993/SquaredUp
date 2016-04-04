//
//  ViewController.m
//  SquaredUp
//
//  Created by  江苏 on 16/4/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray* imageList;
@end

@implementation ViewController
-(NSArray *)imageList{
    if (_imageList==nil) {
        NSArray* array =[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"app" ofType:@"plist"]];
        NSMutableArray* arrM=[NSMutableArray array];
        for (NSDictionary* dict in array) {
            AppInfo* appInfo=[AppInfo appInfoWithDictionary:dict];
            [arrM addObject:appInfo];
        }
        _imageList=arrM;
    }
    return _imageList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
#define appViewWith   90
#define appViewHeight 90
#define colCount      3
#define startY        30
    CGFloat marginX=(self.view.bounds.size.width-appViewWith*colCount)/(colCount+1);
    CGFloat marginY=10;
    for (int i=0; i<12; i++) {
        int row=i/colCount;
        int col=i%colCount;
        CGFloat X=marginX+col*(marginX+appViewWith);
        CGFloat Y=startY+row*(marginY+appViewHeight);
        UIView* view=[[UIView alloc]initWithFrame:CGRectMake(X, Y, appViewWith,appViewHeight)];
        [self.view addSubview:view];
        AppInfo* appInfo=self.imageList[i];
        //添加图片
        UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, appViewWith, 50)];
        UIImage* image=[UIImage imageNamed:appInfo.icon];
        imageView.image=image;
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
        //添加标签
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), appViewWith, 20)];
        label.text=appInfo.name;
        label.font=[UIFont systemFontOfSize:13.0];
        label.textAlignment=NSTextAlignmentCenter;
        [view addSubview:label];
        //添加按钮
        UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(label.frame), appViewWith-30, 20)];
        [button setTitle:@"下载" forState:UIControlStateNormal];
        [button setTitle:@"下载中" forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        button.titleLabel.font=[UIFont systemFontOfSize:12.0];
        [view addSubview:button];
    }
}
@end

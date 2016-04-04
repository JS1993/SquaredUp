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
        button.tag=i;
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }
}
-(void)click:(UIButton*)button{
    AppInfo* appInfo=self.imageList[button.tag];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-30, self.view.bounds.size.width, 30)];
    label.text=appInfo.name;
    label.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.2];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    //设置动画初始值
    button.enabled=NO;
    label.alpha=0;
    /**
     *  动画
     */
    [UIView animateWithDuration:1.0f animations:^{
        label.alpha=1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            label.alpha=0;
        } completion:^(BOOL finished) {
            button.enabled=YES;
            [label removeFromSuperview];
        }];
    }];
}

@end

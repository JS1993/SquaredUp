//
//  AppView.m
//  SquaredUp
//
//  Created by  江苏 on 16/4/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "AppView.h"

@implementation AppView
+(instancetype)buildAppView{
    return  [[[NSBundle mainBundle]loadNibNamed:@"AppView" owner:nil options:nil]lastObject];
}
+(instancetype)initWithAppInfo:(AppInfo*)appInfo{
    AppView* view=[self buildAppView];
    view.appInfo=appInfo;
    return view;
}
-(void)setAppInfo:(AppInfo*)appInfo{
    _appInfo=appInfo;
    self.name.text=appInfo.name;
    self.image.image=[UIImage imageNamed:appInfo.icon];
}
- (IBAction)click:(UIButton *)sender {
    AppInfo* appInfo=_appInfo;
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(90, 458, 160, 30)];
    label.text=appInfo.name;
    label.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.2];
    label.textAlignment=NSTextAlignmentCenter;
    [self.superview addSubview:label];
    //设置动画初始值
    sender.enabled=NO;
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
            sender.enabled=YES;
            [label removeFromSuperview];
        }];
    }];
}

@end

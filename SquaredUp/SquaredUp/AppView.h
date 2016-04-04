//
//  AppView.h
//  SquaredUp
//
//  Created by  江苏 on 16/4/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppInfo.h"
@interface AppView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIButton *ckick;
@property(nonatomic,strong)AppInfo* appInfo;
+(instancetype)initWithAppInfo:(AppInfo*)appInfo;
+(instancetype)buildAppView;
@end

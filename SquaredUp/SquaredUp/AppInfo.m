//
//  AppInfo.m
//  SquaredUp
//
//  Created by  江苏 on 16/4/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo
-(id)initWithDict:(NSDictionary *)dictionary{
    self=[super init];
    if (self) {
        /**
         *  KVC
         */
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}
+(instancetype)appInfoWithDictionary:(NSDictionary*)dictionary {
    return  [[self alloc]initWithDict:dictionary];
}
+(NSArray *)appList{
    NSArray* array =[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"app" ofType:@"plist"]];
    NSMutableArray* arrM=[NSMutableArray array];
    for (NSDictionary* dict in array) {
        AppInfo* appInfo=[AppInfo appInfoWithDictionary:dict];
        [arrM addObject:appInfo];
    }
    return arrM;
}
@end

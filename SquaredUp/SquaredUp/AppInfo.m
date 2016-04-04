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
        self.name=dictionary[@"name"];
        self.icon=dictionary[@"icon"];
    }
    return self;
}
+(instancetype)appInfoWithDictionary:(NSDictionary*)dictionary {
    return  [[self alloc]initWithDict:dictionary];
}
@end

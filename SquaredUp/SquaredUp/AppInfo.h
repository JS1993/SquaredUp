//
//  AppInfo.h
//  SquaredUp
//
//  Created by  江苏 on 16/4/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* icon;
-(id)initWithDict:(NSDictionary*)dictionary;
+(instancetype)appInfoWithDictionary:(NSDictionary*)dictionary;
+(NSArray*)appList;
@end

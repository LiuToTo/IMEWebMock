//
//  IMEHttpMockMapItem.h
//  edu
//
//  Created by 刘ToTo on 2017/1/16.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kIMEHttpMockMapItemHost;
extern NSString *const kIMEHttpMockMapItemMainURL;
extern NSString *const kIMEHttpMockMapItemFilePath;

@interface IMEHttpMockMapItem : NSObject

+ (instancetype)mapItemWithDict:(NSDictionary *)dict;
@property (nonatomic, copy) NSString *host;
@property (nonatomic, strong) NSURL *mainURL;
@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, strong) NSBundle *bundle;

@end

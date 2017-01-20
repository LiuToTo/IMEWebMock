//
//  IMEHttpMockMapItem.m
//  edu
//
//  Created by 刘ToTo on 2017/1/16.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "IMEHttpMockMapItem.h"

NSString *const kIMEHttpMockMapItemHost = @"host";
NSString *const kIMEHttpMockMapItemMainURL = @"mainURL";
NSString *const kIMEHttpMockMapItemFilePath = @"filePath";

@implementation IMEHttpMockMapItem

+ (instancetype)mapItemWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end

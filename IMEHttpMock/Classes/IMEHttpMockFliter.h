//
//  IMEHttpMockFliter.h
//  edu
//
//  Created by 刘ToTo on 2017/1/16.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMEHttpMockMapItem;
@interface IMEHttpMockFliter : NSObject

- (BOOL)shouldMock:(NSURLRequest *)req mockMap:(NSArray<IMEHttpMockMapItem *> *)mockMap;
- (NSString *)pathByReq:(NSURLRequest *)req mockMap:(NSArray<IMEHttpMockMapItem *> *)mockMap;

@end

//
//  IMEHttpMock.m
//  edu
//
//  Created by 刘ToTo on 2017/1/16.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "IMEHttpMock.h"
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>
#import "IMEHttpMockFliter.h"


@interface IMEHttpMock ()

@property (nonatomic, strong) IMEHttpMockFliter *fliter;

@end
@implementation IMEHttpMock

static IMEHttpMock *instance;
+ (instancetype)sharedHttpMock
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)payloadByMockMap:(NSArray<IMEHttpMockMapItem *> *)mockMap;
{
    NSAssert(mockMap||mockMap.count>0, @"mockMap must not be nil or empty");
    _mockMap = mockMap;
    _fliter = [IMEHttpMockFliter new];
    [self resume];
}

- (void)resume
{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest * _Nonnull request) {
        return [_fliter shouldMock:request mockMap:self.mockMap];
    } withStubResponse:^OHHTTPStubsResponse * _Nonnull(NSURLRequest * _Nonnull request) {
        NSString *filePath = [_fliter pathByReq:request mockMap:self.mockMap];
        return [OHHTTPStubsResponse responseWithFileAtPath:filePath statusCode:200 headers:nil];
    }];
}

@end

//
//  IMEHttpMock.h
//  edu
//
//  Created by 刘ToTo on 2017/1/16.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMEHttpMockMapItem.h"

@interface IMEHttpMock : NSObject

+ (instancetype)sharedHttpMock;
- (void)payloadByMockMap:(NSArray<IMEHttpMockMapItem *> *)mockMap;
@property (nonatomic, strong, readonly) NSArray<IMEHttpMockMapItem *> *mockMap;

@end

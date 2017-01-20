//
//  IMEHttpMockFliter.m
//  edu
//
//  Created by 刘ToTo on 2017/1/16.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "IMEHttpMockFliter.h"
#import "IMEHttpMockMapItem.h"

@interface IMEHttpMockFliter ()

@property (nonatomic, strong) NSMutableDictionary *pathCache;

@end
@implementation IMEHttpMockFliter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pathCache = [NSMutableDictionary dictionary];
    }
    return self;
}

- (BOOL)shouldMock:(NSURLRequest *)req mockMap:(NSArray<IMEHttpMockMapItem *> *)mockMap
{
    for (IMEHttpMockMapItem *item in mockMap) {
        if ([req.mainDocumentURL.absoluteString hasPrefix:item.mainURL.absoluteString]&&[req.URL.absoluteString hasPrefix:item.host]) {
            NSString *filePath = [self pathByReq:req mockMap:mockMap];
            // handle
            return filePath.length >0;
        }
    }
    return NO;
}

- (NSString *)pathByReq:(NSURLRequest *)req mockMap:(NSArray<IMEHttpMockMapItem *> *)mockMap
{
    // process url
    NSString *processedUrlString = [self processedReq:req];
    // cache
    NSString *filePath = [_pathCache objectForKey:processedUrlString];
    if (filePath.length >0) {
        return filePath;
    }
    // get file path from url
    for (IMEHttpMockMapItem *item in mockMap) {
        if ([processedUrlString isEqualToString:item.mainURL.absoluteString]) {
            filePath = [item.bundle pathForResource:[processedUrlString stringByReplacingOccurrencesOfString:item.host withString:@""] ofType:nil];
            break;
        }else  if ([req.mainDocumentURL.absoluteString hasPrefix:item.mainURL.absoluteString]){
            NSString *originPath = [processedUrlString stringByReplacingOccurrencesOfString:item.host withString:@""];
            
            if (![originPath hasPrefix:item.filePath]) {
                filePath = [item.bundle pathForResource:[NSString stringWithFormat:@"%@%@",item.filePath,originPath] ofType:nil];
            }else{
                filePath = [item.bundle pathForResource:originPath ofType:nil];
            }
            break;
        }
    }
    BOOL exists =[[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (exists) {
        [_pathCache setObject:filePath forKey:processedUrlString];
    }else{
        filePath = nil;
    }
    
    return filePath;
}

- (NSString *)processedReq:(NSURLRequest *)req
{
    // ignore web route ‘#’
    NSRange specialRange = [req.URL.absoluteString  rangeOfString:@"/#/"];
    NSString *processedUrlString;
    if (specialRange.location != NSNotFound) {
        processedUrlString = [req.URL.absoluteString substringWithRange:NSMakeRange(0, specialRange.location+1)];
    }else{
        processedUrlString = req.URL.absoluteString;
    }
    // ignore parameter flow  '?'
    NSRange range = [processedUrlString rangeOfString:@"?"];
    if (range.location != NSNotFound) {
        processedUrlString = [processedUrlString substringWithRange:NSMakeRange(0, range.location)];
    }
    return processedUrlString;
}

@end

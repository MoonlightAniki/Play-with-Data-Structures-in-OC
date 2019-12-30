//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Set.h"
#import "BSTSet.h"
#import "LinkedListSet.h"
#import "Map.h"
#import "LinkedListMap.h"
#import "BSTMap.h"

void testSet(NSArray *testData, id<Set> set, NSString *setName) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    for (id item in testData) {
        [set add:item];
    }
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    int64_t costTime = (endTime - startTime) * 1000;
    NSLog(@"%@ cost time: %@ ms, size: %@", setName, @(costTime), @([set getSize]));
}

void testMap(NSArray *testData, id<Map> map, NSString *mapName) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    for (id item in testData) {
        [map addObject:([map containsKey:item] ? @([[map objectForKey:item] integerValue] + 1): @1) forKey:item];
    }
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    int64_t costTime = (endTime - startTime) * 1000;
    NSLog(@"%@ cost time: %@ ms, size: %@", mapName, @(costTime), @([map getSize]));
}

int main007()
{
    NSMutableArray<NSNumber *> *testData = [NSMutableArray array];
    NSInteger opCount = 10000;
    for (NSInteger i = 0; i < opCount; ++i) {
        [testData addObject:@(arc4random() % opCount)];
    }
    testSet(testData, [[BSTSet alloc] init], @"BSTSet");
    testSet(testData, [[LinkedListSet alloc] init], @"LinkedListSet");
    testMap(testData, [[BSTMap alloc] init], @"BSTMap");
    testMap(testData, [[LinkedListMap alloc] init], @"LinkedListMap");
    
//    BSTMap<NSNumber*, NSString*> *bstMap = [[BSTMap alloc] init];
//    [bstMap addObject:@"hello" forKey:@1];
//    [bstMap addObject:@"world" forKey:@2];
//    [bstMap addObject:@"Objective-C" forKey:@2];
//    NSLog(@"remove: %@", [bstMap removeObjectForKey:@2]);
//    NSLog(@"size: %@", @([bstMap getSize]));
    return 0;
}

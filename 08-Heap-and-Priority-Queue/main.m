//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/31.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MaxHeap.h"

void testHeap(NSArray *testData, BOOL isHeapify) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    MaxHeap *heap;
    if (isHeapify) {
        heap = [[MaxHeap alloc] initWithArray:testData];
    } else {
        heap = [[MaxHeap alloc] init];
        for (id item in testData) {
            [heap add:item];
        }
    }
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    int64_t costTime = (endTime - startTime) * 1000;
    NSLog(@"isHeapify: %@, cost time: %@ ms", isHeapify ? @"YES" : @"NO", @(costTime));
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < testData.count; ++i) {
        sortedArray[i] = [heap extractMax];
    }
    for (NSInteger i = 1; i < sortedArray.count; ++i) {
        if ([sortedArray[i - 1] isLessThan:sortedArray[i]]) {
            [NSException raise:@"IllegalArgumentException" format:@"Error"];
        }
    }
}

int main008()
{
//    MaxHeap<NSNumber *> *heap = [[MaxHeap alloc] init];
//    [heap add:@1];
//    [heap add:@2];
//    NSLog(@"%@", [heap extractMax]);
//    NSLog(@"%@", @([heap getSize]));
//    NSLog(@"%@", @([heap isEmpty]));
    
    NSInteger opCount = 1000000;
    NSMutableArray *testData = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < opCount; ++i) {
        testData[i] = @(arc4random());
    }
    testHeap(testData, NO);
    testHeap(testData, YES);
    return 0;
}

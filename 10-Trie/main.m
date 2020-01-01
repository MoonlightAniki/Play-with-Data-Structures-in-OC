//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trie.h"
#import "BSTSet.h"

void testTrie(NSArray<NSString *> *testData) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    Trie *trie = [[Trie alloc] init];
    for (NSString *word in testData) {
        [trie add:word];
    }
    for (NSString *word in testData) {
        [trie contains:word];
    }
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    NSInteger costTime = (endTime - startTime) * 1000;
    NSLog(@"Trie, cost time: %@ ms, size: %@", @(costTime), @([trie getSize]));
}

void testNSMutableSet(NSArray<NSString *> *testData) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    NSMutableSet *set = [NSMutableSet set];
    for (NSString *word in testData) {
        [set addObject:word];
    }
    for (NSString *word in testData) {
        [set containsObject:word];
    }
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    NSInteger costTime = (endTime - startTime) * 1000;
    NSLog(@"NSMutableSet, cost time: %@ ms, size: %@", @(costTime), @(set.count));
}

void testBSTSet(NSArray<NSString *> *testData) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    BSTSet *set = [[BSTSet alloc] init];
    for (NSString *word in testData) {
        [set add:word];
    }
    for (NSString *word in testData) {
        [set contains:word];
    }
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    NSInteger costTime = (endTime - startTime) * 1000;
    NSLog(@"BSTSet, cost time: %@ ms, size: %@", @(costTime), @([set getSize]));
}

int main010()
{
    NSInteger opCount = 100000;
    NSMutableArray *testData = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < opCount; ++i) {
        [testData addObject:[NSString stringWithFormat:@"%@", @(arc4random())]];
    }
    testNSMutableSet(testData);
    testBSTSet(testData);
    testTrie(testData);
    return 0;
}

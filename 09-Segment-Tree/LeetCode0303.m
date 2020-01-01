//
//  LeetCode0303.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SegmentTree2.h"

@interface NumArray : NSObject

-(instancetype)initWithArray:(NSArray<NSNumber *> *)array;

-(NSInteger)sumFrom:(NSInteger)from to:(NSInteger)to;

@end

@implementation NumArray
{
    @private
    SegmentTree2<NSNumber *> *_segmentTree;
}

-(instancetype)initWithArray:(NSArray<NSNumber *> *)array {
    if (self = [super init]) {
        _segmentTree = [[SegmentTree2 alloc] initWithArray:array mergeBlock:^NSNumber* (NSNumber *a, NSNumber *b) {
            return @(a.integerValue + b.integerValue);
        }];
    }
    return self;
}

- (NSInteger)sumFrom:(NSInteger)from to:(NSInteger)to {
    return [_segmentTree queryWithQueryL:from queryR:to].integerValue;
}

@end

int main0303()
{
    NumArray *numArray = [[NumArray alloc] initWithArray: @[@-2, @0, @3, @-5, @2, @-1]];
    NSLog(@"%@", @([numArray sumFrom:0 to:2]));
    NSLog(@"%@", @([numArray sumFrom:2 to:5]));
    NSLog(@"%@", @([numArray sumFrom:0 to:5]));
    return 0;
}

//
//  LeetCode0307.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SegmentTree2.h"

@interface MutableNumArray : NSObject

-(instancetype)initWithArray:(NSArray<NSNumber *> *)array;

-(void)update:(NSInteger)value atIndex:(NSInteger)index;

-(NSInteger)sumFrom:(NSInteger)from to:(NSInteger)to;

@end

@implementation MutableNumArray
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

- (void)update:(NSInteger)value atIndex:(NSInteger)index {
    [_segmentTree set:@(value) atIndex:index];
}

-(NSInteger)sumFrom:(NSInteger)from to:(NSInteger)to {
    return [_segmentTree queryWithQueryL:from queryR:to].integerValue;
}

@end

int main0307()
{
    MutableNumArray *numArray = [[MutableNumArray alloc] initWithArray: @[@1, @3, @5]];
    NSLog(@"%@", @([numArray sumFrom:0 to:2]));
    [numArray update:2 atIndex:1];
    NSLog(@"%@", @([numArray sumFrom:0 to:2]));
    return 0;
}

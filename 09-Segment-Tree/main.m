//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SegmentTree.h"

int main009()
{
//    NSLog(@"%@", [NSNull null]);
//    NSLog(@"%@", @([NSNull null] == [NSNull null]));
//    NSLog(@"%@", @([[NSNull null] isEqual: [NSNull null]]));
//    NSLog(@"%@", @([[NSNull null] isEqualTo: [NSNull null]]));
//    NSLog(@"%@", @(!![NSNull null]));
    
    SegmentTree<NSNumber *> *segmentTree = [[SegmentTree alloc] initWithArray:@[@-2, @0, @3, @-5, @2, @-1] mergeBlock:^NSNumber *(NSNumber *a, NSNumber *b) {
        return @(a.integerValue + b.integerValue);
    }];
    //    NSLog(@"%@", segmentTree);
    NSLog(@"%@", [segmentTree queryWithQueryL:0 queryR:2]);
    NSLog(@"%@", [segmentTree queryWithQueryL:2 queryR:5]);
    NSLog(@"%@", [segmentTree queryWithQueryL:0 queryR:5]);
    return 0;
}

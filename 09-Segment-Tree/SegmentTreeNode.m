//
//  SegmentTreeNode.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import "SegmentTreeNode.h"

@implementation SegmentTreeNode

-(instancetype)initWithStart:(NSInteger)start andEnd:(NSInteger)end {
    if (self = [super init]) {
        self.start = start;
        self.end = end;
        self.value = nil;
        self.left = nil;
        self.right = nil;
    }
    return self;
}

@end

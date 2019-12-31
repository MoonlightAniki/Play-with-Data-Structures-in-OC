//
//  PriorityQueue.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/31.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "PriorityQueue.h"
#import "MaxHeap.h"

@implementation PriorityQueue
{
    @private
    MaxHeap *_heap;
}

-(instancetype)init {
    if (self = [super init]) {
        _heap = [[MaxHeap alloc] init];
    }
    return self;
}

-(NSInteger)getSize {
    return [_heap getSize];
}

- (BOOL)isEmpty {
    return [_heap isEmpty];
}

-(void)enqueue:(id)anObject {
    [_heap add:anObject];
}

-(id)dequeue {
    return [_heap extractMax];
}

-(id)getFront {
    return [_heap findMax];
}

@end

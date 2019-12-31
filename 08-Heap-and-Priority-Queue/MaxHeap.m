//
//  MaxHeap.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/31.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "MaxHeap.h"

@interface MaxHeap()
{
    @private
    NSMutableArray *_data;
}

-(NSInteger)parent:(NSInteger)index;

-(NSInteger)leftChild:(NSInteger)index;

-(NSInteger)rightChild:(NSInteger)index;

-(void)swap:(NSInteger)x :(NSInteger)y;

-(void)siftUp:(NSInteger)k;

-(void)siftDown:(NSInteger)k;

@end

@implementation MaxHeap

-(instancetype)init {
    if (self = [super init]) {
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

-(instancetype)initWithCapacity:(NSInteger)capacity {
    if (self = [super init]) {
        _data = [[NSMutableArray alloc] initWithCapacity:capacity];
    }
    return self;
}

-(instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        _data = [[NSMutableArray alloc] initWithArray:array];
        // heapify: 从最后一个非叶子开始 siftDown
        for (NSInteger i = [self parent:_data.count - 1]; i >= 0; --i) {
            [self siftDown:i];
        }
    }
    return self;
}

-(NSInteger)parent:(NSInteger)index {
    if (index == 0) {
        [NSException raise:@"IllegalArgumentException" format:@"index-0 doesn't have parent"];
    }
    return (index - 1) / 2;
}

-(NSInteger)leftChild:(NSInteger)index {
    return index * 2 + 1;
}

-(NSInteger)rightChild:(NSInteger)index {
    return index * 2 + 2;
}

-(id)findMax {
    if (!_data.count) {
        [NSException raise:@"IllegalArgumentException" format:@"Heap is empty"];
    }
    return _data[0];
}

- (void)swap:(NSInteger)x :(NSInteger)y {
    id temp = _data[x];
    _data[x] = _data[y];
    _data[y] = temp;
}

-(void)siftUp:(NSInteger)k {
    // 存在父节点并且父节点小于当前节点
    while(k > 0 && [_data[[self parent:k]] isLessThan:_data[k]]) {
        NSInteger  parent = [self parent:k];
        [self swap:k :parent];
        k = parent;
    }
}

-(void)siftDown:(NSInteger)k {
    // 存在左孩子
    while([self leftChild:k] < _data.count) {
        NSInteger j = [self leftChild:k];
        // 存在右孩子并且右孩子比左孩子大
        if ([self rightChild:k] < _data.count && [_data[[self rightChild:k]] isGreaterThan:_data[[self leftChild:k]]]) {
            j = [self rightChild:k];
        }
        if ([_data[k] isGreaterThanOrEqualTo:_data[j]]) {
            break;
        }
        [self swap:k :j];
        k = j;
    }
}

-(NSInteger)getSize {
    return _data.count;
}

-(BOOL)isEmpty {
    return _data.count == 0;
}

-(void)add:(id)anObject {
    [_data addObject:anObject];
    [self siftUp:_data.count - 1];
}

-(id)extractMax {
    id max = [self findMax];
    [self swap:0 :_data.count - 1];
    [_data removeLastObject];
    [self siftDown:0];
    return max;
}

-(id)replace:(id)anObject {
    id max = [self findMax];
    _data[0] = anObject;
    [self siftDown:0];
    return max;
}

@end

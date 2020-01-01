//
//  SegmentTree.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import "SegmentTree.h"

@interface SegmentTree()

-(NSInteger)leftChild:(NSInteger)index;

-(NSInteger)rightChild:(NSInteger)index;

// 在treeIndex的位置创建表示区间[left...right]的线段树
-(void)buildSegmentTreeWithTreeIndex:(NSInteger)treeIndex left:(NSInteger)left right:(NSInteger)right;

// 在以treeIndex为根的线段树中[left...right]的范围里，搜索区间[queryL...queryR]的值
-(id)queryWithTreeIndex:(NSInteger)treeIndex left:(NSInteger)left right:(NSInteger)right queryL:(NSInteger)queryL queryR:(NSInteger)queryR;

// 在以treeIndex为根的线段树中更新index的值为e
-(void)set:(id)anObject atIndex:(NSInteger)index treeIndex:(NSInteger)treeIndex left:(NSInteger)left right:(NSInteger)right;

@end

@implementation SegmentTree
{
    @private
    NSMutableArray *_data;
    NSMutableArray *_tree;
    SegmentTreeMergeBlock _mergeBlock;
}

-(instancetype)initWithArray:(NSArray *)array mergeBlock:(SegmentTreeMergeBlock)mergeBlock {
    if (self = [super init]) {
        _mergeBlock = mergeBlock;
        _data = [[NSMutableArray alloc] initWithArray:array];
        _tree = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < array.count * 4; ++i) {
            _tree[i] = [NSNull null];
        }
        [self buildSegmentTreeWithTreeIndex:0 left:0 right:array.count - 1];
    }
    return self;
}

-(id)get:(NSInteger)index {
    if (index < 0 || index >= _data.count) {
        [NSException raise:@"IllegalArgumentException" format:@"Require index >= 0 && index < data.count"];
    }
    return _data[index];
}

-(NSInteger)getSize {
    return _data.count;
}

-(id)queryWithQueryL:(NSInteger)queryL queryR:(NSInteger)queryR {
    if (queryL < 0 || queryL >= _data.count || queryR < 0 || queryR >= _data.count || queryL > queryR) {
        [NSException raise:@"IllegalArgumentException" format:@"Index is illegal"];
    }
    return [self queryWithTreeIndex:0 left:0 right:_data.count - 1 queryL:queryL queryR:queryR];
}

-(void)set:(id)anObject atIndex:(NSInteger)index {
    if (index < 0 || index >= _data.count) {
        [NSException raise:@"IllegalArgumentException" format:@"Index is illegal"];
    }
    _data[index] = anObject;
    [self set:anObject atIndex:index treeIndex:0 left:0 right:_data.count - 1];
}

-(NSString *)description {
    NSMutableString *res = [NSMutableString string];
    [res appendString:@"["];
    for (NSInteger i = 0; i < _tree.count; ++i) {
        if (_tree[i] == [NSNull null]) {
            [res appendString:@"nil"];
        } else {
            [res appendFormat:@"%@", _tree[i]];
        }
        if (i != _tree.count - 1) {
            [res appendString:@", "];
        }
    }
    [res appendString:@"]"];
    return [res copy];
}

-(NSInteger)leftChild:(NSInteger)index {
    return index * 2 + 1;
}

-(NSInteger)rightChild:(NSInteger)index {
    return index * 2 + 2;
}

-(void)buildSegmentTreeWithTreeIndex:(NSInteger)treeIndex left:(NSInteger)left right:(NSInteger)right {
    if (left == right) {
        _tree[treeIndex] = _data[left];
        return;
    }
    NSInteger mid = left + (right - left) / 2;
    NSInteger leftTreeIndex = [self leftChild:treeIndex];
    NSInteger rightTreeIndex = [self rightChild:treeIndex];
    [self buildSegmentTreeWithTreeIndex:leftTreeIndex left:left right:mid];
    [self buildSegmentTreeWithTreeIndex:rightTreeIndex left:mid + 1 right:right];
    _tree[treeIndex] = _mergeBlock(_tree[leftTreeIndex], _tree[rightTreeIndex]);
}

-(id)queryWithTreeIndex:(NSInteger)treeIndex left:(NSInteger)left right:(NSInteger)right queryL:(NSInteger)queryL queryR:(NSInteger)queryR {
    if (queryL == left && queryR == right) {
        return _tree[treeIndex];
    }
    NSInteger mid = left + (right - left) / 2;
    NSInteger leftTreeIndex = [self leftChild:treeIndex];
    NSInteger rightTreeIndex = [self rightChild:treeIndex];
    if (queryR <= mid) {
        return [self queryWithTreeIndex:leftTreeIndex left:0 right:mid queryL:queryL queryR:queryR];
    } else if (queryL > mid) {
        return [self queryWithTreeIndex:rightTreeIndex left:mid + 1 right:right queryL:queryL queryR:queryR];
    } else {
        id leftResult = [self queryWithTreeIndex:leftTreeIndex left:left right:mid queryL:queryL queryR:mid];
        id rightResult = [self queryWithTreeIndex:rightTreeIndex left:mid + 1 right:right queryL:mid + 1 queryR:queryR];
        return _mergeBlock(leftResult, rightResult);
    }
}

-(void)set:(id)anObject atIndex:(NSInteger)index treeIndex:(NSInteger)treeIndex left:(NSInteger)left right:(NSInteger)right {
    if (left == right) {
        _tree[treeIndex] = anObject;
        return;
    }
    NSInteger mid = left + (right - left) / 2;
    NSInteger leftTreeIndex = [self leftChild:treeIndex];
    NSInteger rightTreeIndex = [self rightChild:treeIndex];
    if (index <= mid) {
        [self set:anObject atIndex:index treeIndex:leftTreeIndex left:left right:mid];
    } else {
        [self set:anObject atIndex:index treeIndex:rightTreeIndex left:mid + 1 right:right];
    }
    _tree[treeIndex] = _mergeBlock(_tree[leftTreeIndex], _tree[rightTreeIndex]);
}

@end

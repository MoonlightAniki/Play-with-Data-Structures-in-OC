//
//  SegmentTree2.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import "SegmentTree2.h"
#import "SegmentTreeNode.h"

@implementation SegmentTree2
{
    @private
    SegmentTreeNode *_root;
    NSMutableArray *_data;
    SegmentTreeMergeBlock _mergeBlock;
}

-(instancetype)initWithArray:(NSArray *)array mergeBlock:(SegmentTreeMergeBlock)mergeBlock {
    if (self = [super init]) {
        _mergeBlock = mergeBlock;
        _data = [[NSMutableArray alloc] initWithArray:array];
        _root = [self buildSegmentTreeWithStart:0 andEnd:array.count - 1];
    }
    return self;
}

-(id)get:(NSInteger)index {
    if (index < 0 || index >= _data.count) {
        [NSException raise:@"IllegalArgumentException" format:@"Index is illegal"];
    }
    return _data[index];
}

- (NSInteger)getSize {
    return _data.count;
}

- (id)queryWithQueryL:(NSInteger)queryL queryR:(NSInteger)queryR {
    if (queryL < 0 || queryL >= _data.count || queryR < 0 || queryR >= _data.count || queryL > queryR) {
        [NSException raise:@"IllegalArgumentException" format:@"Index is illegal"];
    }
    return [self queryWithQueryL:queryL andQueryR:queryR andRoot:_root];
}

-(void)set:(id)anObject atIndex:(NSInteger)index {
    if (index < 0 || index >= _data.count) {
        [NSException raise:@"IllegalArgumentException" format:@"Index is illegal"];
    }
    _data[index] = anObject;
    _root = [self set:anObject atIndex:index root:_root];
}

-(SegmentTreeNode *)set:(id)anObject atIndex:(NSInteger)index root:(SegmentTreeNode *)root {
    if (root.start == root.end) {
        root.value = anObject;
        return root;
    }
    NSInteger mid = root.start + (root.end - root.start) / 2;
    if (index <= mid) {
        root.left = [self set:anObject atIndex:index root:root.left];
    } else {
        root.right = [self set:anObject atIndex:index root:root.right];
    }
    root.value = _mergeBlock(root.left.value, root.right.value);
    return root;
}

-(id)queryWithQueryL:(NSInteger)queryL andQueryR:(NSInteger)queryR andRoot:(SegmentTreeNode *)root {
    if (queryL == root.start && queryR == root.end) {
        return root.value;
    }
    NSInteger mid = root.start + (root.end - root.start) / 2;
    if (queryR <= mid) {
        return [self queryWithQueryL:queryL andQueryR:queryR andRoot:root.left];
    } else if (queryL > mid) {
        return [self queryWithQueryL:queryL andQueryR:queryR andRoot:root.right];
    } else {
        id leftResult = [self queryWithQueryL:queryL andQueryR:mid andRoot:root.left];
        id rightResult = [self queryWithQueryL:mid + 1 andQueryR:queryR andRoot:root.right];
        return _mergeBlock(leftResult, rightResult);
    }
}

-(SegmentTreeNode *)buildSegmentTreeWithStart:(NSInteger)start andEnd:(NSInteger)end {
    SegmentTreeNode *node = [[SegmentTreeNode alloc] initWithStart:start andEnd:end];
    if (start == end) {
        node.value = _data[start];
        return node;
    }
    NSInteger mid = start + (end - start) / 2;
    node.left = [self buildSegmentTreeWithStart:start andEnd:mid];
    node.right = [self buildSegmentTreeWithStart:mid + 1 andEnd:end];
    node.value = _mergeBlock(node.left.value, node.right.value);
    return node;
}

@end

//
//  BST.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/29.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "BST.h"
#import "TreeNode.h"
#import "LoopQueue.h"

@interface BST()

-(TreeNode *)add:(id)e toRoot:(TreeNode *)node;

-(BOOL)contains:(id)e inRoot:(TreeNode *)node;

-(void)_preOrder:(TreeNode *)node;

-(void)_inOrder:(TreeNode *)node;

-(void)_postOrder:(TreeNode *)node;

-(TreeNode *)minimumNode:(TreeNode *)node;

-(TreeNode *)maximumNode:(TreeNode *)node;

-(TreeNode *)removeMinFromRoot:(TreeNode *)node;

-(TreeNode *)removeMaxFromRoot:(TreeNode *)node;

-(TreeNode *)remove:(id)e fromRoot:(TreeNode *)node;

@end

@implementation BST
{
    @private
    TreeNode *_root;
    NSInteger _size;
}

-(instancetype)init {
    if (self = [super init]) {
        _root = nil;
        _size = 0;
    }
    return self;
}

-(NSInteger)getSize {
    return _size;
}

-(BOOL)isEmpty {
    return _size == 0;
}

-(TreeNode *)add:(id)e toRoot:(TreeNode *)node {
    if (!node) {
        ++_size;
        return [[TreeNode alloc] initWithObject:e];
    }
    if ([e isLessThan:node.e]) {
        node.left = [self add:e toRoot:node.left];
    } else if ([e isGreaterThan:node.e]) {
        node.right = [self add:e toRoot:node.right];
    }
    return node;
}

-(void)add:(id)e {
    _root = [self add:e toRoot:_root];
}

-(BOOL)contains:(id)e inRoot:(TreeNode *)node {
    if (!node) return NO;
    if ([e isEqual:node.e]) {
        return YES;
    } else if ([e isLessThan:node.e]) {
        return [self contains:e inRoot:node.left];
    } else {
        return [self contains:e inRoot:node.right];
    }
}

-(BOOL)contains:(id)e {
    return [self contains:e inRoot:_root];
}

-(void)_preOrder:(TreeNode *)node {
    if (!node) return;
    NSLog(@"%@", node.e);
    [self _preOrder:node.left];
    [self _preOrder:node.right];
}

-(void)preOrder {
    [self _preOrder:_root];
}

-(void)_inOrder:(TreeNode *)node {
    if (!node) return;
    [self _inOrder:node.left];
    NSLog(@"%@", node.e);
    [self _inOrder:node.right];
}

-(void)inOrder {
    [self _inOrder:_root];
}

-(void)_postOrder:(TreeNode *)node {
    if (!node) return;
    [self _postOrder:node.left];
    [self _postOrder:node.right];
    NSLog(@"%@", node.e);
}

-(void)postOrder {
    [self _postOrder:_root];
}

-(void)levelOrder {
    if (!_root) return;
    LoopQueue<TreeNode *> *queue = [[LoopQueue alloc] init];
    [queue enqueue:_root];
    while(![queue isEmpty]) {
        TreeNode *front = [queue dequeue];
        NSLog(@"%@", front.e);
        if (front.left) [queue enqueue:front.left];
        if (front.right) [queue enqueue:front.right];
    }
}

-(TreeNode *)minimumNode:(TreeNode *)node {
    if (node.left) {
        return [self minimumNode:node.left];
    } else {
        return node;
    }
}

-(id)minimum {
    if (!_root) {
        [NSException raise:@"IllegalArgumentException" format:@"BST is empty"];
    }
    TreeNode *minNode = [self minimumNode:_root];
    return minNode.e;
}

-(TreeNode *)maximumNode:(TreeNode *)node {
    if (node.right) {
        return [self maximumNode:node.right];
    } else {
        return node;
    }
}

-(id)maximum {
    if (!_root) {
        [NSException raise:@"IllegalException" format:@"BST is empty"];
    }
    TreeNode *maxNode = [self maximumNode:_root];
    return maxNode.e;
}

-(TreeNode *)removeMinFromRoot:(TreeNode *)node {
    if (node.left) {
        node.left = [self removeMinFromRoot:node.left];
        return node;
    } else {
        TreeNode *rightNode = node.right;
        node.right = nil;
        --_size;
        return rightNode;
    }
}

-(id)removeMin {
    if (!_root) {
        [NSException raise:@"IllegalException" format:@"BST is empty"];
    }
    id ret = [self minimum];
    _root = [self removeMinFromRoot:_root];
    return ret;
}

-(TreeNode *)removeMaxFromRoot:(TreeNode *)node {
    if (node.right) {
        node.right = [self removeMaxFromRoot:node.right];
        return node;
    } else {
        TreeNode *leftNode = node.left;
        node.left = nil;
        --_size;
        return leftNode;
    }
}

-(id)removeMax {
    if (!_root) {
        [NSException raise:@"IllegalArugmentException" format:@"BST is empty"];
    }
    id ret = [self maximum];
    _root = [self removeMaxFromRoot:_root];
    return ret;
}

-(TreeNode *)remove:(id)e fromRoot:(TreeNode *)node {
    if (!node) return node;
    if ([e isLessThan:node.e]) {
        node.left = [self remove:e fromRoot:node.left];
        return node;
    } else if ([e isGreaterThan:node.e]) {
        node.right = [self remove:e fromRoot:node.right];
        return node;
    } else {
        if (!node.left) {
            TreeNode *rightNode = node.right;
            node.right = nil;
            --_size;
            return rightNode;
        } else if (!node.right) {
            TreeNode *leftNode = node.left;
            node.left = nil;
            --_size;
            return leftNode;
        } else {
            TreeNode *successor = [self minimumNode:node.right];
            successor.right = [self removeMinFromRoot:node.right];
            successor.left = node.left;
            node.left = node.right = nil;
            return successor;
        }
    }
}

-(void)remove:(id)e {
    _root = [self remove:e fromRoot:_root];
}

@end

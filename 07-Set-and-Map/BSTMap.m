//
//  BSTMap.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "BSTMap.h"
#import "TreeNodeKV.h"

@interface BSTMap()
{
    @private
    TreeNodeKV *_root;
    NSInteger _size;
}

-(TreeNodeKV *)addNode:(TreeNodeKV *)node toRoot:(TreeNodeKV *)root;

-(TreeNodeKV *)getNodeForKey:(id)aKey inRoot:(TreeNodeKV *)root;

-(TreeNodeKV *)getMinNodeInRoot:(TreeNodeKV *)root;

-(TreeNodeKV *)removeMinNodeFromRoot:(TreeNodeKV *)root;

-(TreeNodeKV *)removeKey:(id)aKey fromRoot:(TreeNodeKV *)root;

@end

@implementation BSTMap

-(instancetype)init {
    if (self = [super init]) {
        _root = nil;
        _size = 0;
    }
    return self;
}

-(TreeNodeKV *)addNode:(TreeNodeKV *)node toRoot:(TreeNodeKV *)root {
    if (!root) {
        ++_size;
        return node;
    }
    if ([node.key isLessThan:root.key]) {
        root.left = [self addNode:node toRoot:root.left];
    } else if ([node.key isGreaterThan:root.key]) {
        root.right = [self addNode:node toRoot:root.right];
    } else {
        root.value = node.value;
    }
    return root;
}

-(TreeNodeKV *)getNodeForKey:(id)aKey inRoot:(TreeNodeKV *)root {
    if (!root) {
        return nil;
    }
    if ([aKey isLessThan:root.key]) {
        return [self getNodeForKey:aKey inRoot:root.left];
    } else if ([aKey isGreaterThan:root.key]) {
        return [self getNodeForKey:aKey inRoot:root.right];
    } else {
        return root;
    }
}

-(TreeNodeKV *)getMinNodeInRoot:(TreeNodeKV *)root {
    if (!root) {
        return nil;
    }
    if (root.left) {
        return [self getMinNodeInRoot:root.left];
    } else {
        return root;
    }
}

-(TreeNodeKV *)removeMinNodeFromRoot:(TreeNodeKV *)root {
    if (!root) {
        return nil;
    }
    if (root.left) {
        root.left = [self removeMinNodeFromRoot:root.left];
        return root;
    } else {
        TreeNodeKV *rightNode = root.right;
        root.right = nil;
        --_size;
        return rightNode;
    }
}

-(TreeNodeKV *)removeKey:(id)aKey fromRoot:(TreeNodeKV *)root {
    if (!root) {
        return nil;
    }
    if ([aKey isLessThan:root.key]) {
        root.left = [self removeKey:aKey fromRoot:root.left];
        return root;
    } else if ([aKey isGreaterThan:root.key]) {
        root.right = [self removeKey:aKey fromRoot:root.right];
        return root;
    } else {
        if (!root.left) {
            TreeNodeKV *rightNode = root.right;
            root.right = nil;
            --_size;
            return rightNode;
        }
        if (!root.right) {
            TreeNodeKV *leftNode = root.left;
            root.left = nil;
            --_size;
            return leftNode;
        }
        TreeNodeKV *successor = [self getMinNodeInRoot:root.right];
        successor.right = [self removeMinNodeFromRoot:root.right];
        successor.left = root.left;
        root.left = root.right = nil;
        return successor;
    }
}

-(void)addObject:(id)anObject forKey:(id)aKey {
    TreeNodeKV *node = [[TreeNodeKV alloc] initWithKey:aKey value:anObject];
    _root = [self addNode:node toRoot:_root];
}

-(BOOL)containsKey:(id)aKey {
    TreeNodeKV *node = [self getNodeForKey:aKey inRoot:_root];
    return !!node;
}

-(NSInteger)getSize {
    return _size;
}

-(BOOL)isEmpty {
    return _size == 0;
}

-(id)objectForKey:(id)aKey {
    TreeNodeKV *node = [self getNodeForKey:aKey inRoot:_root];
    return node ? node.value : nil;
}

-(void)setObject:(id)anObject forKey:(id)aKey {
    TreeNodeKV *node = [self getNodeForKey:aKey inRoot:_root];
    if (!node) {
        [NSException raise:@"IllegalArgument" format:@"%@ doesn't exist!", aKey];
    }
    node.value = anObject;
}



-(id)removeObjectForKey:(id)aKey {
    TreeNodeKV *node = [self getNodeForKey:aKey inRoot:_root];
    if (node) {
        _root = [self removeKey:aKey fromRoot:_root];
    }
    return node ? node.value : nil;
}


@end

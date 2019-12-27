//
//  LinkedListR.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/27.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "LinkedListR.h"
#import "Node.h"

@interface LinkedListR()
{
    @private
    NSInteger _size;
    Node *_head;
}

-(Node *)addObject:(id)anObject atIndex:(NSInteger)index ofHead:(Node *)head;

-(Node *)getNodeAtIndex:(NSInteger)index ofHead:(Node *)head;

-(BOOL)containsObject:(id)anObject head:(Node *)head;

-(NSDictionary<NSString*, Node *> *)removeNodeAtIndex:(NSInteger)index ofHead:(Node *)head;

-(NSDictionary<NSString*, Node *> *)removeFirstObjectIsEqualTo:(id)anObbject ofHead:(Node *)head;

-(Node *)removeAllObjectsIsEqualTo:(id)anObject ofHead:(Node *)head;

@end

@implementation LinkedListR

-(instancetype)initWithArray:(NSArray *)array {
    if (array.count == 0) {
        [NSException raise:@"IllegalArgumentException" format:@"Array cannot be empty"];
    }
    if (self = [super init]) {
        _head = [[Node alloc] initWithObject:array[0]];
        _size = array.count;
        Node *cur = _head;
        for (NSInteger i = 1; i < array.count; ++i) {
            cur.next = [[Node alloc] initWithObject:array[i]];
            cur = cur.next;
        }
    }
    return self;
}

-(instancetype)init {
    if (self = [super init]) {
        _head = nil;
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

-(Node *)addObject:(id)anObject atIndex:(NSInteger)index ofHead:(Node *)head {
    if (index == 0) {
        ++_size;
        return [[Node alloc] initWithObject:anObject andNextNode:head];
    }
    head.next = [self addObject:anObject atIndex:index - 1 ofHead:head.next];
    return head;
}

-(void)addObject:(id)anObject atIndex:(NSInteger)index {
    if (index < 0 || index > _size) {
        [NSException raise:@"IllegalArgumentException" format:@"Require index >= 0 && index <= size"];
    }
    _head = [self addObject:anObject atIndex:index ofHead:_head];
}

-(void)addFirst:(id)anObject {
    [self addObject:anObject atIndex:0];
}

-(void)addLast:(id)anObject {
    [self addObject:anObject atIndex:_size];
}

-(Node *)getNodeAtIndex:(NSInteger)index ofHead:(Node *)head {
    if (index == 0) {
        return head;
    } else {
        return [self getNodeAtIndex:index - 1 ofHead:head.next];
    }
}

-(id)getObjectAtIndex:(NSInteger)index {
    if (index < 0 || index >= _size) {
        [NSException raise:@"IllegalArgumentException" format:@"Require index >= 0 && index < size"];
    }
    return [self getNodeAtIndex:index ofHead:_head].e;
}

-(id)getFirstObject {
    return [self getObjectAtIndex:0];
}

-(id)getLastObject {
    return [self getObjectAtIndex:_size - 1];
}

-(void)setObject:(id)anObject atIndex:(NSInteger)index {
    if (index < 0 || index >= _size) {
        [NSException raise:@"IllegalArgumentException" format:@"Require index >= 0 && index < size"];
    }
    Node *node = [self getNodeAtIndex:index ofHead:_head];
    node.e = anObject;
}

-(BOOL)containsObject:(id)anObject head:(Node *)head {
    if (!head) {
        return NO;
    }
    if ([head.e isEqual:anObject]) {
        return YES;
    } else {
        return [self containsObject:anObject head:head.next];
    }
}

-(BOOL)containsObject:(id)anObject {
    return [self containsObject:anObject head:_head];
}

-(NSDictionary<NSString*, Node *> *)removeNodeAtIndex:(NSInteger)index ofHead:(Node *)head {
    NSMutableDictionary *res = [[NSMutableDictionary alloc] init];
    if (index == 0) {
        Node *delNode = head;
        head = delNode.next;
        delNode.next = nil;
        --_size;
        res[@"head"] = head;
        res[@"delNode"] = delNode;
        return res;
    }
    NSDictionary *dict = [self removeNodeAtIndex:index - 1 ofHead:head.next];
    head.next = dict[@"head"];
    res[@"head"] = head;
    res[@"delNode"] = dict[@"delNode"];
    return res;
}

-(id)removeObjectAtIndex:(NSInteger)index {
    if (index < 0 || index >= _size) {
        [NSException raise:@"IllegalArgumentException" format:@"Require index >= 0 && index < size"];
    }
    NSDictionary<NSString*, Node *> *res = [self removeNodeAtIndex:index ofHead:_head];
    _head = res[@"head"];
    return res[@"delNode"].e;
}

-(id)removeFirstObject {
    return [self removeObjectAtIndex:0];
}

-(id)removeLastObject {
    return [self removeObjectAtIndex:_size - 1];
}

-(NSDictionary<NSString*, Node *> *)removeFirstObjectIsEqualTo:(id)anObject ofHead:(Node *)head {
    NSMutableDictionary *res = [[NSMutableDictionary alloc] init];
    if (!head) {
        return res;
    }
    if ([head.e isEqual:anObject]) {
        Node *delNode = head;
        head = delNode.next;
        delNode.next = nil;
        --_size;
        res[@"head"] = head;
        res[@"delNode"] = delNode;
        return res;
    } else {
        NSDictionary *dict = [self removeFirstObjectIsEqualTo:anObject ofHead:head.next];
        head.next = dict[@"head"];
        res[@"head"] = head;
        res[@"delNode"] = dict[@"delNode"];
        return res;
    }
}

-(BOOL)removeFirstObjectIsEqualTo:(id)anObject {
    NSDictionary<NSString*, Node*> *res = [self removeFirstObjectIsEqualTo:anObject ofHead:_head];
    _head = res[@"head"];
    return !!res[@"delNode"];
}

-(Node *)removeAllObjectsIsEqualTo:(id)anObject ofHead:(Node *)head {
    if (!head) {
        return head;
    }
    head.next = [self removeAllObjectsIsEqualTo:anObject ofHead:head.next];
    return [head.e isEqual:anObject] ? head.next: head;
}

-(void)removeAllObjectsIsEqualTo:(id)anObject {
    _head = [self removeAllObjectsIsEqualTo:anObject ofHead:_head];
}

-(NSString *)description {
    NSMutableString *res = [NSMutableString string];
    for (Node *cur = _head; cur; cur = cur.next) {
        [res appendFormat:@"%@->", cur.e];
    }
    [res appendString:@"nil"];
    return [res copy];
}

@end

//
//  LinkedList.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/26.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "LinkedList.h"
#import "Node.h"

@interface LinkedList()

@property(nonatomic)Node *dummyHead;

@property(nonatomic, assign)NSInteger size;

@end

@implementation LinkedList

-(instancetype)init {
    if (self = [super init]) {
        self.dummyHead = [[Node alloc] init];
        self.size = 0;
    }
    return self;
}

-(instancetype)initWithArray:(NSArray *)array {
    if (!array.count) {
        [NSException raise:@"IllegalArgumentException" format:@"Array can not be empty!"];
    }
    if (self = [super init]) {
        self.dummyHead = [[Node alloc] init];
        self.size = array.count;
        Node *prev = self.dummyHead;
        for (NSInteger i = 0; i < array.count; ++i) {
            prev.next = [[Node alloc] initWithObject:array[i]];
            prev = prev.next;
        }
    }
    return self;
}

-(NSInteger)getSize {
    return self.size;
}

-(BOOL)isEmpty {
    return self.size == 0;
}

-(void)addObject:(id)anObject atIndex:(NSInteger)index {
    if (index < 0 || index > self.size) {
        [NSException raise:@"NSRangeException" format:@"Require index >= 0 && index <= size"];
    }
    Node *prev = self.dummyHead;
    for (NSInteger i = 0; i < index; ++i) {
        prev = prev.next;
    }
    Node *node = [[Node alloc] initWithObject:anObject andNextNode:prev.next];
    prev.next = node;
    ++self.size;
}

-(void)addFirst:(id)anObject {
    [self addObject:anObject atIndex:0];
}

-(void)addLast:(id)anObject {
    [self addObject:anObject atIndex:self.size];
}

-(id)getObjectAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.size) {
        [NSException raise:@"NSRangeException" format:@"Require index >= 0 && index < size"];
    }
    Node *cur = self.dummyHead.next;
    for (NSInteger i = 0; i < index; ++i) {
        cur = cur.next;
    }
    return cur.e;
}

-(id)getFirstObject {
    return [self getObjectAtIndex:0];
}

-(id)getLastObject {
    return [self getObjectAtIndex:self.size - 1];
}

-(void)setObject:(id)anObject atIndex:(NSInteger)index {
    if (index < 0 || index >= self.size) {
        [NSException raise:@"NSRangeException" format:@"Require index >= 0 && index < size"];
    }
    Node *cur = self.dummyHead.next;
    for (NSInteger i = 0; i < index; ++i) {
        cur = cur.next;
    }
    cur.e = anObject;
}

-(BOOL)containsObject:(id)anObject {
    for (Node *cur = self.dummyHead.next; cur; cur = cur.next) {
        if ([cur.e isEqual:anObject]) {
            return YES;
        }
    }
    return NO;
}

-(id)removeObjectAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.size) {
        [NSException raise:@"NSRangeException" format:@"Require index >= 0 && index < size"];
    }
    Node *prev = self.dummyHead;
    for (NSInteger i = 0; i < index; ++i) {
        prev = prev.next;
    }
    Node *delNode = prev.next;
    prev.next = delNode.next;
    delNode.next = nil;
    --self.size;
    return delNode.e;
}

-(id)removeFirstObject {
    return [self removeObjectAtIndex:0];
}

-(id)removeLastObject {
    return [self removeObjectAtIndex:self.size - 1];
}

-(BOOL)removeFirstObjectIsEqualTo:(id)anObject {
    for (Node *prev = self.dummyHead; prev; prev = prev.next) {
        if ([prev.next.e isEqual:anObject]) {
            Node *delNode = prev.next;
            prev.next = delNode.next;
            delNode.next = nil;
            --self.size;
            return YES;
        }
    }
    return NO;
}

-(void)removeAllObjectsIsEqualTo:(id)anObject {
    Node *prev = self.dummyHead;
    while(prev.next) {
        if ([prev.next.e isEqual:anObject]) {
            Node *delNode = prev.next;
            prev.next = delNode.next;
            delNode.next = nil;
            --self.size;
        } else {
            prev = prev.next;
        }
    }
}

-(NSString *)description {
    NSMutableString *res = [NSMutableString string];
    for (Node *cur = self.dummyHead.next; cur; cur = cur.next) {
        [res appendFormat:@"%@->", cur.e];
    }
    [res appendString:@"nil"];
    return [res copy];
}

@end

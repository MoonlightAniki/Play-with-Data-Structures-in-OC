//
//  LinkedListQueue.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/26.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "LinkedListQueue.h"
#import "Node.h"

@interface LinkedListQueue()

@property(nonatomic)Node *head;

@property(nonatomic)Node *tail;

@property(nonatomic, assign)NSInteger size;

@end

@implementation LinkedListQueue

-(instancetype)init {
    if (self = [super init]) {
        self.head = nil;
        self.tail = nil;
        self.size = 0;
    }
    return self;
}

-(NSInteger)getSize {
    return self.size;
}

-(BOOL)isEmpty {
    return self.size == 0;
}

-(void)enqueue:(id)anObject {
    if ([self isEmpty]) {
        self.head = self.tail = [[Node alloc] initWithObject:anObject];
    } else {
        self.tail.next = [[Node alloc] initWithObject:anObject];
        self.tail = self.tail.next;
    }
    ++self.size;
}

-(id)dequeue {
    if ([self isEmpty]) {
        [NSException raise:@"NSRangeException" format:@"Queue is empty"];
    }
    if (self.size == 1) {
        id ret = self.head.e;
        self.head = self.tail = nil;
        self.size = 0;
        return ret;
    } else {
        Node *delNode = self.head;
        self.head = delNode.next;
        delNode.next = nil;
        --self.size;
        return delNode.e;
    }
}

-(id)getFront {
    if ([self isEmpty]) {
        [NSException raise:@"NSRangeException" format:@"Queue is empty"];
    }
    return self.head.e;
}

-(NSString *)description {
    NSMutableString *res = [NSMutableString string];
    [res appendString:@"LinkedListQueue: tail ["];
    for (Node *cur = self.head; cur; cur = cur.next) {
        [res appendFormat:@"%@", cur.e];
        if (cur != self.tail) {
            [res appendString:@", "];
        }
    }
    [res appendString:@"] front"];
    return [res copy];
}

@end

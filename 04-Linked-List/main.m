//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/26.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import "Queue.h"
#import "LinkedList.h"
#import "LinkedListStack.h"
#import "LinkedListQueue.h"
#import "ArrayStack.h"
#import "ArrayQueue.h"
#import "LoopQueue.h"

void testStack(id<Stack> stack, NSString *stackName, NSInteger opCount) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    for (NSInteger i = 0; i < opCount; ++i) {
        [stack push:@(arc4random())];
    }
    for (NSInteger i = 0; i < opCount; ++i) {
        [stack pop];
    }
    NSLog(@"isEmpty: %@", @([stack isEmpty]));
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    int64_t costTime = (endTime - startTime) * 1000;
    NSLog(@"%@ cost time: %@ ms", stackName, @(costTime));
}

void testQueue(id<Queue> queue, NSString *queuekName, NSInteger opCount) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    for (NSInteger i = 0; i < opCount; ++i) {
        [queue enqueue:@(arc4random())];
    }
    for (NSInteger i = 0; i < opCount; ++i) {
        [queue dequeue];
    }
    NSLog(@"isEmpty: %@", @([queue isEmpty]));
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    int64_t costTime = (endTime - startTime) * 1000;
    NSLog(@"%@ cost time: %@ ms", queuekName, @(costTime));
}

int main004() {
//    LinkedList<NSNumber *> *list = [[LinkedList alloc] initWithArray:@[@1, @2, @3, @4, @5]];
//    NSLog(@"%@", list);
//
//    [list addFirst:@100];
//    [list addLast:@200];
//    NSLog(@"%@", list);
//    NSLog(@"size: %@", @([list getSize]));
//    NSLog(@"isEmpty: %@", @([list isEmpty]));
//
//    [list setObject:@200 atIndex:2];
//    NSLog(@"%@", list);
//
//    NSLog(@"removed: %@", [list removeObjectAtIndex:1]);
//    NSLog(@"%@", list);
//    NSLog(@"size: %@", @([list getSize]));
//
//    NSLog(@"%@", @([list removeFirstObjectIsEqualTo:@3]));
//    NSLog(@"%@", list);
//    NSLog(@"size: %@", @([list getSize]));
//    NSLog(@"contains 3: %@", @([list containsObject:@3]));
//    NSLog(@"contains 4: %@", @([list containsObject:@4]));
//
//    [list removeAllObjectsIsEqualTo:@200];
//    NSLog(@"%@", list);
    
//    [list removeObjectAtIndex:100];
    
//    LinkedListStack *s = [[LinkedListStack alloc] init];
//    for (NSInteger i = 0; i < 5; ++i) {
//        [s push:@(i)];
//        NSLog(@"%@", s);
//    }
//    while(![s isEmpty]) {
//        NSLog(@"peek: %@", [s peek]);
//        [s pop];
//        NSLog(@"%@", s);
//    }
    
//    LinkedListQueue *q = [[LinkedListQueue alloc] init];
//    for (NSInteger i = 0; i < 5; ++i) {
//        [q enqueue:@(i)];
//        NSLog(@"size: %@, isEmpty: %@, queue: %@", @([q getSize]), @([q isEmpty]), q);
//    }
//    while (![q isEmpty]) {
//        [q dequeue];
//        NSLog(@"size: %@, isEmpty: %@, queue: %@", @([q getSize]), @([q isEmpty]), q);
//    }
    
    NSInteger opCount = 10000000;
//    testStack([[ArrayStack alloc] init], @"ArrayStack", opCount);
//    testStack([[LinkedListStack alloc] init], @"LinkedListStack", opCount);
    
    
//    testQueue([[ArrayQueue alloc] init], @"ArrayQueue", opCount);
    testQueue([[LoopQueue alloc] init], @"LoopQueue", opCount);
    testQueue([[LinkedListQueue alloc] init], @"LinkedListQueue", opCount);
    return 0;
}

//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/23.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArrayStack.h"
#import "ArrayQueue.h"
#import "LoopQueue.h"
#import "Queue.h"

void testQueue(id<Queue> queue, NSString *queueName, NSInteger opCount) {
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    for (NSInteger i = 0; i < opCount; ++i) {
        [queue enqueue:@(i)];
    }
    while(![queue isEmpty]) {
        [queue dequeue];
    }
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%@, opCount: %@, cost time: %@ ms", queueName, @(opCount), @((endTime - startTime) * 1000));
}

int main003() {
//    ArrayStack<NSNumber *> *stack = [[ArrayStack alloc] init];
//    for (NSInteger i = 0; i < 10; ++i) {
//        [stack push:@(i)];
//    }
//    NSLog(@"%@", stack);
//
//    NSLog(@"pop: %@", [stack pop]);
//    NSLog(@"%@", stack);
//
//    NSLog(@"peek: %@", [stack peek]);
//    NSLog(@"%@", stack);
//
//    NSLog(@"======================================================================");
//
//    ArrayQueue<NSNumber *> *arrayQueue = [[ArrayQueue alloc] init];
//    for (NSInteger i = 0; i < 10; ++i) {
//        [arrayQueue enqueue:@(i)];
//    }
//    NSLog(@"%@", arrayQueue);
//
//    NSLog(@"dequeue: %@", [arrayQueue dequeue]);
//    NSLog(@"%@", arrayQueue);
//
//    NSLog(@"getFront: %@", [arrayQueue getFront]);
//    NSLog(@"%@", arrayQueue);
//
//    NSLog(@"======================================================================");
//
//    LoopQueue<NSNumber *> *loopQueue = [[LoopQueue alloc] init];
//    for (NSInteger i = 0; i < 10; ++i) {
//        [loopQueue enqueue:@(i)];
//    }
//    NSLog(@"%@", loopQueue);
//
//    NSLog(@"dequeue: %@", [loopQueue dequeue]);
//    NSLog(@"%@", loopQueue);
//
//    NSLog(@"getFront: %@", [loopQueue getFront]);
//    NSLog(@"%@", loopQueue);
    
    LoopQueue *loopQueue = [[LoopQueue alloc] init];
    ArrayQueue *arrayQueue = [[ArrayQueue alloc] init];
    NSInteger opCount = 10000;
    testQueue(loopQueue, @"LoopQueue", opCount);
    testQueue(arrayQueue, @"ArrayQueue", opCount);
    return 0;
}

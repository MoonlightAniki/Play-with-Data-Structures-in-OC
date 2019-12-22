//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/23.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Array.h"

int main002() {
    Array<NSNumber *> *arr = [[Array alloc] init];
    NSLog(@"arr = %@", arr);
    
    for (NSInteger i = 0; i < 10; ++i) {
        [arr addLast:@(i)];
    }
    NSLog(@"arr = %@", arr);
    
    [arr addFirst:@-1];
    NSLog(@"arr = %@", arr);
    
    [arr insertObject:@100 atIndex:1];
    NSLog(@"arr = %@", arr);
    
    [arr removeObject:@9];
    NSLog(@"arr = %@", arr);
    
//    for (NSInteger i = 0; i < 9; ++i) {
//        NSNumber *removedElement;
//        if (i % 2) {
//            removedElement = [arr removeFirst];
//        } else {
//            removedElement = [arr removeLast];
//        }
//        NSLog(@"i = %@, removedElement = %@, arr = %@", @(i), removedElement, arr);
//    }
    
    Array<NSString *> *arr2 = [[Array alloc] init];
    [arr2 addLast:@"hello"];
    NSLog(@"arr2 = %@", arr2);
    [arr2 removeObject:@"hello"];
    NSLog(@"arr2 = %@", arr2);
    return 0;
}

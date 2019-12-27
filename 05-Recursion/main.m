//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/27.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListR.h"

int main005() {
    LinkedListR *list = [[LinkedListR alloc] init];
    for (NSInteger i = 0; i < 10; ++i) {
        if (i % 2) {
            [list addFirst:@(i)];
        } else {
            [list addLast:@(i)];
        }
    }
    NSLog(@"%@", list);
//    NSLog(@"size: %@", @([list getSize]));
//    NSLog(@"isEmpty: %@", @([list isEmpty]));
//
//    NSLog(@"fistObject: %@", [list getFirstObject]);
//    NSLog(@"lastObject: %@", [list getLastObject]);
//
//    [list setObject:@100 atIndex:5];
//    NSLog(@"%@", list);
//
//    NSLog(@"contains 100: %@", @([list containsObject:@100]));
//    NSLog(@"contains 200: %@", @([list containsObject:@200]));
//    NSLog(@"contains nil: %@", @([list containsObject:nil]));
    
//    NSLog(@"removeFirstObject: %@", [list removeFirstObject]);
//    NSLog(@"%@", list);
//    NSLog(@"size: %@", @([list getSize]));
//    NSLog(@"isEmpty: %@", @([list isEmpty]));
//    NSLog(@"removeLastObject: %@", [list removeLastObject]);
//    NSLog(@"%@", list);
//    NSLog(@"size: %@", @([list getSize]));
//    NSLog(@"isEmpty: %@", @([list isEmpty]));
//    [list removeFirstObjectIsEqualTo:@9];
//    NSLog(@"%@", list);
//    [list removeFirstObjectIsEqualTo:@100];
//    NSLog(@"%@", list);
//    [list removeFirstObjectIsEqualTo:@0];
//    NSLog(@"%@", list);
//
//    [list addLast:@7];
//    NSLog(@"%@", list);
//
//    [list removeAllObjectsIsEqualTo:@7];
//    NSLog(@"%@", list);
    return 0;
}

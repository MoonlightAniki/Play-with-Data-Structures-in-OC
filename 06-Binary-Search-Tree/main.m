//
//  main.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/29.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BST.h"

int main006()
{
    BST<NSNumber *> *bst = [[BST alloc] init];
    [bst add:@5];
    [bst add:@9];
    [bst add:@1];
    [bst add:@2];
    [bst add:@7];
    [bst add:@4];
    [bst add:@0];
    NSLog(@"contains 10: %@", @([bst contains:@10]));
    NSLog(@"contains 1: %@", @([bst contains:@1]));
    NSLog(@"getSize: %@", @([bst getSize]));
    NSLog(@"isEmpty: %@", @([bst isEmpty]));
    NSLog(@"preOrder");
    [bst preOrder];
    NSLog(@"inOrder");
    [bst inOrder];
    NSLog(@"postOrder");
    [bst postOrder];
    NSLog(@"levelOrder");
    [bst levelOrder];
    NSLog(@"remove 1");
    [bst remove:@1];
    [bst inOrder];
    return 0;
}

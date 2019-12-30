//
//  BSTSet.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "BSTSet.h"
#import "BST.h"

@implementation BSTSet
{
    @private
    BST *_bst;
}

-(instancetype)init {
    if (self = [super init]) {
        _bst = [[BST alloc] init];
    }
    return self;
}

-(void)add:(id)e {
    [_bst add:e];
}

-(BOOL)contains:(id)e {
    return [_bst contains:e];
}

-(void)remove:(id)e {
    [_bst remove:e];
}

-(NSInteger)getSize {
    return [_bst getSize];
}

-(BOOL)isEmpty {
    return [_bst isEmpty];
}

@end

//
//  TreeNode.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/29.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

-(instancetype)initWithObject:(id)e {
    if (self = [super init]) {
        self.e = e;
        self.left = nil;
        self.right = nil;
    }
    return self;
}

@end

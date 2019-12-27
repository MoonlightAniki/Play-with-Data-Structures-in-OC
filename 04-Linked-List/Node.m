//
//  Node.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/27.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "Node.h"

@implementation Node

-(instancetype)initWithObject:(id)e andNextNode:(nonnull Node *)next {
    if (self = [super init]) {
        self.e = e;
        self.next = next;
    }
    return self;
}

-(instancetype)initWithObject:(id)e {
    return [self initWithObject:e andNextNode:nil];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@", self.e];
}

@end

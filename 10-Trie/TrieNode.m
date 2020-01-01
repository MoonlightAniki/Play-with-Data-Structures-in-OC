//
//  TrieNode.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import "TrieNode.h"

@implementation TrieNode

-(instancetype)init {
    return [self initWithIsWord:NO];
}

-(instancetype)initWithIsWord:(BOOL)isWord {
    if (self = [super init]) {
        self.isWord = isWord;
        self.next = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end

//
//  Trie.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import "Trie.h"
#import "TrieNode.h"

@implementation Trie
{
    @private
    TrieNode *_root;
    NSInteger _size;
}

-(instancetype)init {
    if (self = [super init]) {
        _root = [[TrieNode alloc] init];
        _size = 0;
    }
    return self;
}

-(NSInteger)getSize {
    return _size;
}

-(BOOL)isEmpty {
    return _size == 0;
}

-(void)add:(NSString *)word {
    TrieNode *cur = _root;
    for (NSInteger i = 0; i < word.length; ++i) {
        NSString *c = [NSString stringWithFormat:@"%C", [word characterAtIndex:i]];
        if (!cur.next[c]) {
            cur.next[c] = [[TrieNode alloc] init];
        }
        cur = cur.next[c];
    }
    if (!cur.isWord) {
        cur.isWord = YES;
        ++_size;
    }
}

-(BOOL)contains:(NSString *)word {
    TrieNode *cur = _root;
    for (NSInteger i = 0; i < word.length; ++i) {
        NSString *c = [NSString stringWithFormat:@"%C", [word characterAtIndex:i]];
        if (!cur.next[c]) {
            return NO;
        }
        cur = cur.next[c];
    }
    return cur.isWord;
}

-(BOOL)isPrefix:(NSString *)prefix {
    TrieNode *cur = _root;
    for (NSInteger i = 0; i < prefix.length; ++i) {
        NSString *c = [NSString stringWithFormat:@"%C", [prefix characterAtIndex:i]];
        if (!cur.next[c]) {
            return NO;
        }
        cur = cur.next[c];
    }
    return YES;
}

@end

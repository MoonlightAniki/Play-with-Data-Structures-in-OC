//
//  LeetCode0211.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trie.h"

@interface WDNode : NSObject

@property(nonatomic, assign)BOOL isWord;

@property(nonatomic)NSMutableDictionary<NSString*, WDNode*> *next;

-(instancetype)initWithIsWord:(BOOL)isWord;

@end

@implementation WDNode

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

@interface WordDictionary : NSObject

-(void)addWord:(NSString *)word;

-(BOOL)search:(NSString *)word;

@end

@implementation WordDictionary
{
    @private
    WDNode *_root;
}

-(instancetype)init {
    if (self = [super init]) {
        _root = [[WDNode alloc] init];
    }
    return self;
}

-(void)addWord:(NSString *)word {
    WDNode *cur = _root;
    for (NSInteger i = 0; i < word.length; ++i) {
        NSString *c = [NSString stringWithFormat:@"%C", [word characterAtIndex:i]];
        if (!cur.next[c]) {
            cur.next[c] = [[WDNode alloc] init];
        }
        cur = cur.next[c];
    }
    cur.isWord = YES;
}

-(BOOL)search:(NSString *)word {
    return [self match:word index:0 node:_root];
}

-(BOOL)match:(NSString *)word index:(NSInteger)index node:(WDNode *)node {
    if (index == word.length) {
        return node.isWord;
    }
    NSString *c = [NSString stringWithFormat:@"%C", [word characterAtIndex:index]];
    if ([@"." isEqualToString:c]) {
        for (NSString *k in node.next.allKeys) {
            if ([self match:word index:index + 1 node:node.next[k]]) {
                return YES;
            }
        }
        return NO;
    } else {
        if (node.next[c]) {
            return [self match:word index:index + 1 node:node.next[c]];
        } else {
            return NO;
        }
    }
}

@end

int main0211()
{
    /*
     addWord("bad")
     addWord("dad")
     addWord("mad")
     search("pad") -> false
     search("bad") -> true
     search(".ad") -> true
     search("b..") -> true
     */
    WordDictionary *wd = [[WordDictionary alloc] init];
    [wd addWord:@"bad"];
    [wd addWord:@"dad"];
    [wd addWord:@"mad"];
    NSLog(@"%@", @([wd search:@"pad"]));
    NSLog(@"%@", @([wd search:@"bad"]));
    NSLog(@"%@", @([wd search:@".ad"]));
    NSLog(@"%@", @([wd search:@"b.."]));
    return 0;
}

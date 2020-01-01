//
//  LeetCode0677.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSNode: NSObject

@property(nonatomic, assign)NSInteger value;

@property(nonatomic)NSMutableDictionary<NSString*, MSNode*> *next;

-(instancetype)initWithValue:(NSInteger)value;

@end

@implementation MSNode

-(instancetype)init {
    return [self initWithValue:0];
}

-(instancetype)initWithValue:(NSInteger)value {
    if (self = [super init]) {
        self.value = value;
        self.next = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end

@interface MapSum : NSObject

-(void)insertWithKey:(NSString *)key value:(NSInteger)value;

-(NSInteger)sum:(NSString *)prefix;

@end

@implementation MapSum
{
    @private
    MSNode *_root;
}

-(instancetype)init {
    if (self = [super init]) {
        _root = [[MSNode alloc] init];
    }
    return self;
}

-(void)insertWithKey:(NSString *)key value:(NSInteger)value {
    MSNode *cur = _root;
    for (NSInteger i = 0; i < key.length; ++i) {
        NSString *c = [NSString stringWithFormat:@"%C", [key characterAtIndex:i]];
        if (!cur.next[c]) {
            cur.next[c] = [[MSNode alloc] init];
        }
        cur = cur.next[c];
    }
    cur.value = value;
}

-(NSInteger)sum:(NSString *)prefix {
    MSNode *cur = _root;
    for (NSInteger i = 0; i < prefix.length; ++i) {
        NSString *c = [NSString stringWithFormat:@"%C", [prefix characterAtIndex:i]];
        if (!cur.next[c]) {
            return 0;
        }
        cur = cur.next[c];
    }
    return [self _sum:cur];
}

-(NSInteger)_sum:(MSNode *)node {
    NSInteger sum = node.value;
    for (MSNode *next in node.next.allValues) {
        sum += [self _sum:next];
    }
    return sum;
}

@end

int main0677()
{
    /*
     Input: insert("apple", 3), Output: Null
     Input: sum("ap"), Output: 3
     Input: insert("app", 2), Output: Null
     Input: sum("ap"), Output: 5
     */
    MapSum *ms = [[MapSum alloc] init];
    [ms insertWithKey:@"apple" value:3];
    NSLog(@"%@", @([ms sum:@"ap"]));
    [ms insertWithKey:@"app" value:2];
    NSLog(@"%@", @([ms sum:@"ap"]));
    return 0;
}

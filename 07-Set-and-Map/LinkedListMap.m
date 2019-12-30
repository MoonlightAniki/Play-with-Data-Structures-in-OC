//
//  LinkedListMap.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "LinkedListMap.h"
#import "ListNodeKV.h"

@interface LinkedListMap()
{
    @private
    ListNodeKV *_dummyHead;
    NSInteger _size;
}

-(ListNodeKV *)getNodeForKey:(id)aKey;

@end

@implementation LinkedListMap

-(ListNodeKV *)getNodeForKey:(id)aKey {
    for (ListNodeKV *cur = _dummyHead.next; cur; cur = cur.next) {
        if ([aKey isEqual:cur.key]) {
            return cur;
        }
    }
    return nil;
}

-(instancetype)init {
    if (self = [super init]) {
        _dummyHead = [[ListNodeKV alloc] init];
        _size = 0;
    }
    return self;
}

-(BOOL)containsKey:(id)aKey {
    ListNodeKV *node = [self getNodeForKey:aKey];
    return !!node;
}

-(void)addObject:(id)anObject forKey:(id)aKey {
    ListNodeKV *node = [self getNodeForKey:aKey];
    if (node) {
        node.value = anObject;
    } else {
        ListNodeKV *node = [[ListNodeKV alloc] initWithKey:aKey value:anObject next:_dummyHead.next];
        _dummyHead.next = node;
        ++_size;
    }
}

-(id)removeObjectForKey:(id)aKey {
    for (ListNodeKV *prev = _dummyHead; prev.next; prev = prev.next) {
        if ([aKey isEqual:prev.next.key]) {
            ListNodeKV *delNode = prev.next;
            prev.next = delNode.next;
            delNode.next = nil;
            --_size;
            return delNode.value;
        }
    }
    return nil;
}

-(id)objectForKey:(id)aKey {
    ListNodeKV *node = [self getNodeForKey:aKey];
    return node ? node.key: nil;
}

-(void)setObject:(id)anObject forKey:(id)aKey {
    ListNodeKV *node = [self getNodeForKey:aKey];
    if (!node) {
        [NSException raise:@"IllegalArgument" format:@"%@ doesn't exist!", aKey];
    }
    node.value = anObject;
}

- (NSInteger)getSize {
    return _size;
}

-(BOOL)isEmpty {
    return _size == 0;
}

@end

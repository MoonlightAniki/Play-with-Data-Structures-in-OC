//
//  LoopQueue.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/23.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "LoopQueue.h"

@interface LoopQueue<ObjectType>()
{
    @private
    NSMutableArray<ObjectType> *_data;
    NSInteger _front;
    NSInteger _tail;
    NSInteger _size;
    NSInteger _capacity;
}

-(void)resize:(NSInteger)newCapacity;

@end

@implementation LoopQueue

-(instancetype)initWithCapacity:(NSInteger)capacity {
    if (self = [super init]) {
        _data = [[NSMutableArray alloc] initWithCapacity:capacity + 1];
        _capacity = capacity;
        _front = 0;
        _tail = 0;
        _size = 0;
    }
    return self;
}

-(instancetype)init {
    return [self initWithCapacity:10];
}

-(NSInteger)getSize {
    return _size;
}

-(BOOL)isEmpty {
    return _front == _tail;
}

-(void)enqueue:(id)anObject {
    if ((_tail + 1) % (_capacity + 1) == _front) {
        [self resize:_capacity * 2];
    }
    _data[_tail] = anObject;
    _tail = (_tail + 1) % (_capacity + 1);
    ++_size;
}

-(id)dequeue {
    if ([self isEmpty]) {
        @throw [NSException exceptionWithName:@"NSRangeException"
                                       reason:@"Cannot dequeue from an empty queue."
                                     userInfo:nil];
    }
    id ret = _data[_front];
    _front = (_front + 1) % (_capacity + 1);
    --_size;
    if (_size == _capacity / 4 && _capacity / 2 != 0) {
        [self resize:_capacity / 2];
    }
    return ret;
}

-(id)getFront {
    if ([self isEmpty]) {
        @throw [NSException exceptionWithName:@"NSRangeException"
                                       reason:@"Queue is empty."
                                     userInfo:nil];
    }
    return _data[_front];
}

-(NSString *)description {
    NSMutableString *res = [NSMutableString string];
    [res appendString:@"LoopQueue: "];
    [res appendString:@"front ["];
    for (NSInteger i = _front; i != _tail; i = (i + 1) % (_capacity + 1)) {
        [res appendFormat:@"%@", _data[i]];
        if ((i + 1) % (_capacity + 1) != _tail) {
            [res appendString:@", "];
        }
    }
    [res appendString:@"] tail"];
    return res;
}

-(void)resize:(NSInteger)newCapacity {
    NSMutableArray *newData = [[NSMutableArray alloc] initWithCapacity:newCapacity + 1];
    for (NSInteger i = 0; i < _size; ++i) {
        newData[i] = _data[(_front + i) % (_capacity + 1)];
    }
    _data = newData;
    _front = 0;
    _tail = _size;
    _capacity = newCapacity;
}

@end

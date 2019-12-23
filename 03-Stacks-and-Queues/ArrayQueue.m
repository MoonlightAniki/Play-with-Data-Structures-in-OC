//
//  ArrayQueue.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/23.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "ArrayQueue.h"
#import "Array.h"

@interface ArrayQueue<ObjectType>()

@property(nonatomic) Array<ObjectType> *array;

@end;

@implementation ArrayQueue

-(instancetype)initWithCapacity:(NSInteger)capacity {
    if (self = [super init]) {
        self.array = [[Array alloc] initWithCapacity:capacity];
    }
    return self;
}

-(instancetype)init {
    return [self initWithCapacity:10];
}

-(NSInteger)getSize {
    return [self.array getSize];
}

-(BOOL)isEmpty {
    return [self.array isEmpty];
}

-(void)enqueue:(id)anObject {
    [self.array addLast:anObject];
}

-(id)dequeue {
    return [self.array removeFirst];
}

-(id)getFront {
    return self.array.firstObject;
}

-(NSString *)description {
    NSMutableString *res = [NSMutableString string];
    [res appendString:@"Queue: "];
    [res appendString:@"front ["];
    NSInteger size = [self.array getSize];
    for (NSInteger i = 0; i < size; ++i) {
        [res appendFormat:@"%@", [self.array objectAtIndex:i]];
        if (i != size - 1) {
            [res appendString:@", "];
        }
    }
    [res appendString:@"] tail"];
    return res;
}

@end

//
//  Array.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/22.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "Array.h"

@interface Array<ObjectType>()

@property(nonatomic) NSMutableArray<ObjectType> *data;

@property(nonatomic, assign) NSInteger capacity;

@property(nonatomic, assign) NSInteger size;

-(void)resize:(NSInteger)newCapacity;

@end

@implementation Array

-(instancetype)initWithCapacity:(NSInteger)capacity {
    if (self = [super init]) {
        self.capacity = capacity;
        self.data = [[NSMutableArray alloc] initWithCapacity:capacity];
        self.size = 0;
    }
    return self;
}

-(instancetype)init {
    return [self initWithCapacity:10];
}

-(NSInteger)getCapacity {
    return self.capacity;
}

-(NSInteger)getSize {
    return self.size;
}

-(BOOL)isEmpty {
    return self.size == 0;
}

-(void)insertObject:(id)anObject atIndex:(NSInteger)index {
    if (index < 0 || index > self.size) {
        @throw [NSException exceptionWithName:@"NSRangeException"
                                       reason:@"Require index >= 0 && index <= size."
                                     userInfo:nil];
    }
    if (self.size == self.capacity) {
        [self resize:self.capacity * 2];
    }
    for (NSInteger i = self.size - 1; i >= index; --i) {
        self.data[i + 1] = self.data[i];
    }
    self.data[index] = anObject;
    ++self.size;
}

-(void)addFirst:(id)anObject {
    [self insertObject:anObject atIndex:0];
}

-(void)addLast:(id)anObject {
    [self insertObject:anObject atIndex:self.size];
}

-(id)objectAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"NSRangeException"
                                       reason:@"Require index >= 0 && index < size."
                                     userInfo:nil];
    }
    return self.data[index];
}

-(void)replaceObjectAtIndex:(NSInteger)index withObject:(id)anObject {
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"NSRangeException"
                                       reason:@"Require index >= 0 && index < size."
                                     userInfo:nil];
    }
    self.data[index] = anObject;
}

-(BOOL)containsObject:(id)anObject {
    for (NSInteger i = 0; i < self.size; ++i) {
        if ([self.data[i] isEqual:anObject]) {
            return YES;
        }
    }
    return NO;
}

-(NSInteger)indexOfObject:(id)anObject {
    for (NSInteger i = 0; i < self.size; ++i) {
        if ([self.data[i] isEqual:anObject]) {
            return i;
        }
    }
    return -1;
}

-(id)removeObjectAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"NSRangeException"
                                       reason:@"Require index >= 0 && index < size."
                                     userInfo:nil];
    }
    id ret = self.data[index];
    for (NSInteger i = index; i < self.size - 1; ++i) {
        self.data[i] = self.data[i + 1];
    }
//    self.data[self.size - 1] = nil;
    --self.size;
    if (self.size <= self.capacity / 4 && self.capacity / 2 > 0) {
        [self resize:self.capacity / 2];
    }
    return ret;
}

-(id)removeFirst {
    return [self removeObjectAtIndex:0];
}

-(id)removeLast {
    return [self removeObjectAtIndex:(self.size - 1)];
}

-(BOOL)removeObject:(id)anObject {
    NSInteger index = [self indexOfObject:anObject];
    if (index == -1) {
        return NO;
    }
    [self removeObjectAtIndex:index];
    return YES;
}

-(id)firstObject {
    return [self objectAtIndex:0];
}

-(id)lastObject {
    return [self objectAtIndex:self.size - 1];
}

-(void)resize:(NSInteger)newCapacity {
    NSMutableArray *newData = [[NSMutableArray alloc] initWithCapacity:newCapacity];
    for (NSInteger i = 0; i < self.size; ++i) {
        newData[i] = self.data[i];
    }
    self.data = newData;
    self.capacity = newCapacity;
}

-(NSString *)description {
    NSMutableString *res = [[NSMutableString alloc] init];
    [res appendFormat:@"Array: size = %@, capacity = %@\n", @(self.size), @(self.capacity)];
    [res appendString:@"["];
    for (NSInteger i = 0; i < self.size; ++i) {
        [res appendFormat:@"%@", self.data[i]];
        if (i != self.size - 1) {
            [res appendString:@", "];
        }
    }
    [res appendString:@"]"];
    return res;
}

@end

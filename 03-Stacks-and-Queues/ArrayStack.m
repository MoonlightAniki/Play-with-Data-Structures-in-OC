//
//  ArrayStack.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/23.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "ArrayStack.h"
#import "Array.h"

@interface ArrayStack<ObjectType>()

@property(nonatomic) Array<ObjectType> *array;

@end

@implementation ArrayStack

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

-(void)push:(id)anObject {
    [self.array addLast:anObject];
}

-(id)pop {
    return [self.array removeLast];
}

-(id)peek {
    return self.array.lastObject;
}

-(NSString *)description {
    NSMutableString *res = [NSMutableString string];
    [res appendFormat:@"ArrayStack: "];
    [res appendString:@"["];
    NSInteger size = [self.array getSize];
    for (NSInteger i = 0; i < size; ++i) {
        [res appendFormat:@"%@", [self.array objectAtIndex:i]];
        if (i != size - 1) {
            [res appendString:@", "];
        }
    }
    [res appendString:@"] top"];
    return res;
}


@end

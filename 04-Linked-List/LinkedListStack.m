//
//  LinkedListStack.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/26.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "LinkedListStack.h"
#import "LinkedList.h"

@interface LinkedListStack()

@property(nonatomic)LinkedList *list;

@end

@implementation LinkedListStack

-(instancetype)init {
    if (self = [super init]) {
        self.list = [[LinkedList alloc] init];
    }
    return self;
}

-(NSInteger)getSize {
    return [self.list getSize];
}

-(BOOL)isEmpty {
    return [self.list isEmpty];
}

-(void)push:(id)anObject {
    [self.list addFirst:anObject];
}

-(id)pop {
    return [self.list removeFirstObject];
}

-(id)peek {
    return [self.list getFirstObject];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"LinkedListStack: top %@", self.list];
}

@end

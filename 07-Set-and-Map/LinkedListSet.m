//
//  LinkedListSet.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "LinkedListSet.h"
#import "LinkedList.h"

@implementation LinkedListSet
{
    @private
    LinkedList *_list;
    
}

-(instancetype)init {
    if (self = [super init]) {
        _list = [[LinkedList alloc] init];
    }
    return self;
}

-(void)add:(id)e {
    if (![_list containsObject:e]) {
        [_list addFirst:e];
    }
}

-(BOOL)contains:(id)e {
    return [_list containsObject:e];
}

-(void)remove:(id)e {
    [_list removeFirstObjectIsEqualTo:e];
}

-(NSInteger)getSize {
    return [_list getSize];
}

-(BOOL)isEmpty {
    return [_list isEmpty];
}

@end

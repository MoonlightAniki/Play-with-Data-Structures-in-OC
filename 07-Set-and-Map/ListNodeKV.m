//
//  ListNodeKV.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "ListNodeKV.h"

@implementation ListNodeKV

-(instancetype)initWithKey:(id)key value:(id)value next:(ListNodeKV *)next {
    if (self = [super init]) {
        self.key = key;
        self.value = value;
        self.next = next;
    }
    return self;
}

-(instancetype)initWithKey:(id)key value:(id)value {
    return [self initWithKey:key value:value next:nil];
}

-(instancetype)init {
    return [self initWithKey:nil value:nil];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ : %@", self.key, self.value];
}

@end

//
//  TreeNodeKV.m
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import "TreeNodeKV.h"

@implementation TreeNodeKV

-(instancetype)initWithKey:(id)key value:(id)value {
    if (self = [super init]) {
        self.key = key;
        self.value = value;
        self.left = nil;
        self.right = nil;
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ : %@", self.key, self.value];
}

@end

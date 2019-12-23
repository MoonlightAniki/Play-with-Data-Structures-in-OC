//
//  ArrayStack.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/23.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArrayStack<ObjectType> : NSObject <Stack>

-(instancetype)initWithCapacity:(NSInteger)capacity;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END

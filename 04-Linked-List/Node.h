//
//  Node.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/27.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node<ObjectType> : NSObject

@property(nonatomic) ObjectType e;

@property(nonatomic) Node* next;

-(instancetype)initWithObject:(ObjectType)e andNextNode:(Node *)next;

-(instancetype)initWithObject:(ObjectType)e;

@end

NS_ASSUME_NONNULL_END

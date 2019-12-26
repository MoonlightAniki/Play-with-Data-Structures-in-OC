//
//  LinkedList.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/26.
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

@interface LinkedList<ObjectType> : NSObject

-(instancetype)initWithArray:(NSArray<ObjectType> *)array;

-(NSInteger)getSize;

-(BOOL)isEmpty;

-(void)addObject:(ObjectType)anObject atIndex:(NSInteger)index;

-(void)addFirst:(ObjectType)anObject;

-(void)addLast:(ObjectType)anObject;

-(ObjectType)getObjectAtIndex:(NSInteger)index;

-(ObjectType)getFirstObject;

-(ObjectType)getLastObject;

-(void)setObject:(ObjectType)anObject atIndex:(NSInteger)index;

-(BOOL)containsObject:(ObjectType)anObject;

-(ObjectType)removeObjectAtIndex:(NSInteger)index;

-(ObjectType)removeFirstObject;

-(ObjectType)removeLastObject;

-(BOOL)removeFirstObjectIsEqualTo:(ObjectType)anObject;

-(void)removeAllObjectsIsEqualTo:(ObjectType)anObject;

@end

NS_ASSUME_NONNULL_END

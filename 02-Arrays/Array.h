//
//  Array.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/22.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Array<ObjectType> : NSObject

-(instancetype)initWithCapacity:(NSInteger)capacity;

-(instancetype)init;

@property(nonatomic, readonly) ObjectType firstObject;

@property(nonatomic, readonly) ObjectType lastObject;

-(NSInteger)getCapacity;

-(NSInteger)getSize;

-(BOOL)isEmpty;

-(void)insertObject:(ObjectType)anObject atIndex:(NSInteger)index;

-(void)addFirst:(ObjectType)anObject;

-(void)addLast:(ObjectType)anObject;

-(ObjectType)objectAtIndex:(NSInteger)index;

-(void)replaceObjectAtIndex:(NSInteger)index withObject:(ObjectType)anObject;

-(BOOL)containsObject:(ObjectType)anObject;

-(NSInteger)indexOfObject:(ObjectType)anObject;

-(ObjectType)removeObjectAtIndex:(NSInteger)index;

-(ObjectType)removeFirst;

-(ObjectType)removeLast;

-(BOOL)removeObject:(ObjectType)anObject;

@end

NS_ASSUME_NONNULL_END

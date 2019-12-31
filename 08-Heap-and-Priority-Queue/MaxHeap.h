//
//  MaxHeap.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/31.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MaxHeap<ObjectType> : NSObject

-(instancetype)initWithCapacity:(NSInteger)capacity;

-(instancetype)initWithArray:(NSArray<ObjectType> *)array;

-(NSInteger)getSize;

-(BOOL)isEmpty;

-(void)add:(ObjectType)anObject;

-(ObjectType)findMax;

-(ObjectType)extractMax;

-(ObjectType)replace:(ObjectType)anObject;

@end

NS_ASSUME_NONNULL_END

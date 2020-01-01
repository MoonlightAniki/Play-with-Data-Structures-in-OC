//
//  SegmentTree2.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SegmentTree.h"

NS_ASSUME_NONNULL_BEGIN

@interface SegmentTree2<ObjectType> : NSObject

-(instancetype)initWithArray:(NSArray<ObjectType> *)array mergeBlock:(SegmentTreeMergeBlock)mergeBlock;

-(ObjectType)get:(NSInteger)index;

-(NSInteger)getSize;

-(ObjectType)queryWithQueryL:(NSInteger)queryL queryR:(NSInteger)queryR;

-(void)set:(ObjectType)anObject atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END

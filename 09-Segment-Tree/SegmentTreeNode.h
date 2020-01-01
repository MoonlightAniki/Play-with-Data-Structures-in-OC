//
//  SegmentTreeNode.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SegmentTreeNode<ObjectType> : NSObject

@property(nonatomic, nullable)ObjectType value;

@property(nonatomic, assign)NSInteger start;

@property(nonatomic, assign)NSInteger end;

// 左子树
@property(nonatomic, nullable)SegmentTreeNode *left;

// 右子树
@property(nonatomic, nullable)SegmentTreeNode *right;

-(instancetype)initWithStart:(NSInteger)start andEnd:(NSInteger)end;

@end

NS_ASSUME_NONNULL_END

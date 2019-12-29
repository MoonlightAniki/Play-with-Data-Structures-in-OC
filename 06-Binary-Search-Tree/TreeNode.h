//
//  TreeNode.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/29.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode<ObjectType> : NSObject

@property(nonatomic) ObjectType e;

@property(nonatomic, nullable) TreeNode *left;

@property(nonatomic, nullable) TreeNode *right;

-(instancetype)initWithObject:(ObjectType)e;

@end

NS_ASSUME_NONNULL_END

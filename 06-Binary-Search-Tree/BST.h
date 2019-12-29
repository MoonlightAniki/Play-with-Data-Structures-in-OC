//
//  BST.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/29.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BST<ObjectType> : NSObject

-(NSInteger)getSize;

-(BOOL)isEmpty;

-(void)add:(ObjectType)e;

-(BOOL)contains:(ObjectType)e;

-(void)preOrder;

-(void)inOrder;

-(void)postOrder;

-(void)levelOrder;

-(ObjectType)minimum;

-(ObjectType)maximum;

-(ObjectType)removeMin;

-(ObjectType)removeMax;

-(void)remove:(ObjectType)e;

@end

NS_ASSUME_NONNULL_END

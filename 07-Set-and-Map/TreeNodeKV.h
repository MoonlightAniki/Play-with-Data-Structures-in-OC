//
//  TreeNodeKV.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNodeKV<KeyType, ObjectType> : NSObject

@property(nonatomic)KeyType key;

@property(nonatomic, nullable)ObjectType value;

@property(nonatomic, nullable)TreeNodeKV *left;

@property(nonatomic, nullable)TreeNodeKV *right;

-(instancetype)initWithKey:(KeyType)aKey value:(ObjectType)value;

@end

NS_ASSUME_NONNULL_END

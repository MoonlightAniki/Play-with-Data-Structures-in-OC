//
//  ListNodeKV.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNodeKV<KeyType, ObjectType> : NSObject

@property(nonatomic, nullable)KeyType key;

@property(nonatomic, nullable)ObjectType value;

@property(nonatomic, nullable)ListNodeKV *next;

-(instancetype)initWithKey:(KeyType)key value:(ObjectType)value;

-(instancetype)initWithKey:(KeyType)key value:(ObjectType)value next:(ListNodeKV *)next;

@end

NS_ASSUME_NONNULL_END

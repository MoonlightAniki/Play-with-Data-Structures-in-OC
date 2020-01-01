//
//  TrieNode.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrieNode : NSObject

@property(nonatomic, assign)BOOL isWord;

@property(nonatomic)NSMutableDictionary<NSString*, TrieNode*> *next;

-(instancetype)initWithIsWord:(BOOL)isWord;

@end

NS_ASSUME_NONNULL_END

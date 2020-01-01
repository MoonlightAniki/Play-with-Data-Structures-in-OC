//
//  Trie.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2020/1/1.
//  Copyright © 2020 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Trie : NSObject

-(NSInteger)getSize;

-(BOOL)isEmpty;

-(void)add:(NSString *)word;

-(BOOL)contains:(NSString *)word;

-(BOOL)isPrefix:(NSString *)prefix;

@end

NS_ASSUME_NONNULL_END

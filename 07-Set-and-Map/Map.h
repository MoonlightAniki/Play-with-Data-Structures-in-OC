//
//  Map.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Map <NSObject>

-(void)addObject:(id)anObject forKey:(id)aKey;

-(id)removeObjectForKey:(id)aKey;

-(BOOL)containsKey:(id)aKey;

-(id)objectForKey:(id)aKey;

-(void)setObject:(id)anObject forKey:(id)aKey;

-(NSInteger)getSize;

-(BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END

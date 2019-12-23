//
//  Queue.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/23.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Queue <NSObject>

-(NSInteger)getSize;

-(BOOL)isEmpty;

-(void)enqueue:(id)anObject;

-(id)dequeue;

-(id)getFront;

@end

NS_ASSUME_NONNULL_END

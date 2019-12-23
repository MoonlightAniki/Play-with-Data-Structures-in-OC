//
//  Stack.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/23.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Stack <NSObject>

-(NSInteger)getSize;

-(BOOL)isEmpty;

-(void)push:(id)anObject;

-(id)pop;

-(id)peek;

@end

NS_ASSUME_NONNULL_END

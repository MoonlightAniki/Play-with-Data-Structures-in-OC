//
//  Set.h
//  Play-with-Data-Structrues-in-OC
//
//  Created by Liang Guo on 2019/12/30.
//  Copyright © 2019 guoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Set <NSObject>

-(void)add:(id)e;

-(BOOL)contains:(id)e;

-(void)remove:(id)e;

-(NSInteger)getSize;

-(BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END

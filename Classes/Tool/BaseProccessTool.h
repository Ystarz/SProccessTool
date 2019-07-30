//
//  BaseProccessTool.h
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProccessResultHandler.h"
NS_ASSUME_NONNULL_BEGIN
typedef enum {
    SProccessTypeShell=1<<0,
    SProccessTypeRuby=1<<1,
    SProccessTypeExpect=1<<2,
    SProccessTypeShellDirect=1<<3,
} SProccessType;

/**
 派生类中自己的handle处理
 */
typedef ProccessResult* _Nullable (^ SpecialHandle)(NSString * valueStr);

@interface BaseProccessTool : NSObject
@property (assign,nonatomic) double task_timeout;
@property (strong,nonatomic) BaseProccessResultHandler* resultHandler;
/**
 执行某种类型的脚本
 
 @param type <#type description#>
 @param content <#content description#>
 @return <#return value description#>
 */
-(NSString*)doWorkOnType:(SProccessType)type WithContent:(NSString*)content;

/**
 统一处理handle
 */
-(ProccessResult*) doHandleResult: (NSString *) content handle :(SpecialHandle) handle;

@end

NS_ASSUME_NONNULL_END

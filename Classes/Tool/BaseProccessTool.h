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
    SProccessTypeRuby,
    SProccessTypeExpect,
} SProccessType;

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
@end

NS_ASSUME_NONNULL_END

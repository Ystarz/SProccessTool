//
//  BaseProccessResultHandler.m
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "BaseProccessResultHandler.h"




@implementation BaseProccessResultHandler

-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult{
    ProccessResult*result=[ProccessResult new];
    //基类,父类永远只判断失败的情况,除非到具体类必须该条件才成立
    [result setOriginalResult:oriResult];
    [result setIsRunSucceed:true];
    [result setResultReason:SResultReason_AllSuccess];
    [result setResult:ALL_SUCCESS];
    
    //结果是否为空
    if ([NSString isNull:oriResult]) {
        [result setIsRunSucceed:false];
        [result setResultReason:SResultReason_Unknown];
        [result setResult:NO_RESULT];
    }
    //结果是否包含明显的失败信息
    if ([oriResult containsString:@"fail"]||[oriResult containsString:@"error"]) {
        [result setIsRunSucceed:false];
        [result setResultReason:SResultReason_Unknown];
        [result setResult:NO_RESULT];
    }
    return result;
}


@end

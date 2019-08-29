//
//  FastlaneShellProccessResultHandler.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "FastlaneProccessResultHandler.h"

#define FAST_NEED_UPDATE @"fastlane need to update"
#define SERVER_503 @"fastlane need to update"
#define INVALID_BYTE @"invalid byte sequence in US-ASCII"
@implementation FastlaneProccessResultHandler

-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult{
    ProccessResult*result=[super handleResultFromOrinalResult:oriResult];
    //判断父类处理结果,失败结果直接返回,成功结果继续分析
    if (!result.isRunSucceed) {
        return result;
    }
    
    if ([oriResult containsString:@"You should use the latest version"]) {
        [result setIsRunSucceed:true];
        [result setResultReason:SResultFastlaneReason_NeedUpdate];
        [result setResult:FAST_NEED_UPDATE];
    }
    //结果包含明显的成功信息
   else if ([oriResult containsString:@"fastlane.tools finished successfully"]) {
        [result setIsRunSucceed:true];
        [result setResultReason:SResultFastlaneReason_AllSuccess];
        [result setResult:ALL_SUCCESS];
    }
    
    //尽量只判断失败的情况,未发现异常关键字即成功
   if ([oriResult containsString:@"503 Service Temporarily Unavailable"]) {
       [result setIsRunSucceed:FALSE];
       [result setResultReason:SResultFastlaneReason_FailToLogin];
       [result setResult:SERVER_503];
   }
   else if ([oriResult containsString:@"invalid byte sequence in US-ASCII"]) {
       [result setIsRunSucceed:FALSE];
       [result setResultReason:SResultFastlaneReason_Unknown];
       [result setResult:INVALID_BYTE];
   }
    return result;
}
@end


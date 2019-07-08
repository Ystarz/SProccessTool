//
//  FastlaneShellProccessResultHandler.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "FastlaneProccessResultHandler.h"

#define FAST_NEED_UPDATE @"fastlane need to update"

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
    //结果是否包含明显的成功信息
   else if ([oriResult containsString:@"fastlane.tools finished successfully"]) {
        [result setIsRunSucceed:true];
        [result setResultReason:SResultFastlaneReason_AllSuccess];
        [result setResult:ALL_SUCCESS];
    }
    //基类,父类永远只判断失败的情况,除非到具体类必须该条件才成立
    return result;
}
@end


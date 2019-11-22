//
//  FastlaneShellProccessResultHandler.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "FastlaneProccessResultHandler.h"
#import "UpdateFastlaneProccessTool.h"

#define CON_NO_APPLEID @"Optional: Your Apple ID:"
#define CON_NO_PARA @"To not be asked about this value"
#define CON_INVALID_BTYE @"invalid byte sequence in US-ASCII"
#define CON_NEED_UPDATE @"You should use the latest version"
#define CON_NEED_UPDATE_1 @"sudo gem install fastlane"
#define CON_SERVER_503 @"503 Service Temporarily Unavailable"
#define CON_FASTLANE_SUCCESS @"fastlane.tools finished successfully"
#define CON_LICENSE_NEED_UPDATE @"agree to the latest Program License Agreement in your developer account"

#define RES_FAST_NEED_UPDATE @"fastlane need to update"
#define RES_INVALID_BTYE @"invalid byte sequence in US-ASCII"
#define RES_NO_APPLEID @"no apple id for fastlane"
#define RES_NO_PARA @"no enough para for fastlane"
#define RES_SERVER_503 @"server 503"
#define RES_LICENSE_NEED_UPDATE @"need to login developer.apple.com to accept the updated agreement"

@implementation FastlaneProccessResultHandler

-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult{
    ProccessResult*result=[super handleResultFromOrinalResult:oriResult];
    //判断父类处理结果,失败结果直接返回,成功结果继续分析
    if (!result.isRunSucceed) {
        return result;
    }
    
    if ([oriResult containsString:CON_NEED_UPDATE]||[oriResult containsString:CON_NEED_UPDATE_1]) {
        [result setIsRunSucceed:true];
        [result setResultReason:SResultFastlaneReason_NeedUpdate];
        [result setResult:RES_FAST_NEED_UPDATE];
        QUEUE_ASYNC_LOW(
                        //异步
                        [[[UpdateFastlaneProccessTool alloc]init] doWorkWithExpPath:[FastlaneProccessTool sharedInstance].updateExpPath pwd:[FastlaneProccessTool sharedInstance].pwd];
                        );
    }
    //结果包含明显的成功信息
    else if ([oriResult containsString:CON_FASTLANE_SUCCESS]) {
        [result setIsRunSucceed:true];
        [result setResultReason:SResultFastlaneReason_AllSuccess];
        [result setResult:ALL_SUCCESS];
    }
    
    //尽量只判断失败的情况,未发现异常关键字即成功
    if ([oriResult containsString:CON_SERVER_503]) {
        [result setIsRunSucceed:FALSE];
        [result setResultReason:SResultFastlaneReason_FailToLogin];
        [result setResult:RES_SERVER_503];
    }
    else if ([oriResult containsString:CON_INVALID_BTYE]) {
        [result setIsRunSucceed:FALSE];
        [result setResultReason:SResultFastlaneReason_Unknown];
        [result setResult:RES_INVALID_BTYE];
    }
    else if ([oriResult containsString:CON_LICENSE_NEED_UPDATE]) {
        [result setIsRunSucceed:FALSE];
        [result setResultReason:SResultFastlaneReason_NeedUpdateLicense];
        [result setResult:RES_LICENSE_NEED_UPDATE];
    }
    else if ([oriResult containsString:CON_NO_APPLEID]) {
        result.result=RES_NO_APPLEID;
        [result setResultReason:SResultFastlaneReason_Unknown];
        result.isRunSucceed=false;
    }
    else if ([oriResult containsString:CON_NO_PARA]) {
        result.result=RES_NO_PARA;
        [result setResultReason:SResultFastlaneReason_Unknown];
        result.isRunSucceed=false;
    }
    return result;
}
@end


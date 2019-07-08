//
//  CacheLocalDeviceProccessResultHandler.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "CacheLocalDeviceProccessResultHandler.h"

#define NO_ACCESS_PERMIT @"No Access Permition To Handle it!"
#define ERR_PARAS @"Pass Error Paras!"

@implementation CacheLocalDeviceProccessResultHandler
-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult{
    ProccessResult*result=[super handleResultFromOrinalResult:oriResult];
    //判断父类处理结果,失败结果直接返回,成功结果继续分析
    if (!result.isRunSucceed) {
        return result;
    }
    
    if ([result.originalResult containsString:@"fail to delete"]) {
        [result setIsRunSucceed:false];
        [result setResultReason:SResultFileReason_NoAccessPermition];
        [result setResult:NO_ACCESS_PERMIT];
    }
    else if([result.originalResult containsString:@"error paras"]) {
        [result setIsRunSucceed:false];
        [result setResultReason:SResultFileReason_ErrorParas];
        [result setResult:ERR_PARAS];
    }
    else if([result.originalResult containsString:@"run succeed"]){
        [result setIsRunSucceed:true];
        [result setResultReason:SResultFileReason_AllSuccess];
        [result setResult:ALL_SUCCESS];
    }
    return result;
}
@end

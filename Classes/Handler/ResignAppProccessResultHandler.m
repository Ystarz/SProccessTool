//
//  ResignAppProccessResultHandler.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ResignAppProccessResultHandler.h"

@implementation ResignAppProccessResultHandler
-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult{
    ProccessResult*result=[super handleResultFromOrinalResult:oriResult];
    //判断父类处理结果,失败结果直接返回,成功结果继续分析
    if (!result.isRunSucceed) {
        return result;
    }
    
    if([result.originalResult containsString:@"Creating the Signed IPA"]){
        [result setIsRunSucceed:true];
        [result setResultReason:SResultReason_AllSuccess];
        [result setResult:ALL_SUCCESS];
    }
    return result;
}
@end
//
//  CertProccessResultHandler.m
//  AutoCreateCer
//
//  Created by SSS on 2019/7/4.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "CertProccessResultHandler.h"

#define CON_EXIST_LOCAL_CER @"which is installed on the local machine. Using this one."
#define CON_MAX_CERS @"reached the maximum number of available Distribution certificates"
#define CON_SUCCESS_ALL @"Result: "

#define RES_EXIST_LOCAL_CER @"there is a available cer on local machine"
#define RES_MAX_CERS @"please revoke certs on the account,and retry later"
#define RES_FAIL_TO_GET_CERNAME @"multi 'result' in the result"


@implementation CertProccessResultHandler
-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult{
    ProccessResult*result=[super handleResultFromOrinalResult:oriResult];
    //判断父类处理结果,失败结果直接返回,成功结果继续分析
    if (!result.isRunSucceed) {
        return result;
    }
    
    NSString*strResult=result.originalResult;
    if ([strResult containsString:CON_EXIST_LOCAL_CER]) {//本地存在已经安装的cer证书
        result.isRunSucceed=false;
        result.resultReason=SResultFastlaneCerReason_LocalCerExist;
        result.result=RES_EXIST_LOCAL_CER;
        return result;
    }
    else if([strResult containsString:RES_EXIST_LOCAL_CER]) {//cer证书已经存在3个
        result.isRunSucceed=false;
        result.resultReason=SResultFastlaneCerReason_MaxCers;
        result.result=RES_MAX_CERS;
        return result;
    }
    //TODO:有cookie的时候似乎不存在输入密码的情况,所以先不用判断需要密码的时候吧
    NSLog(@"rrr--%@",strResult);
    //截取最后的cer名称
    if ([strResult containsString:CON_SUCCESS_ALL]) {
        //NSArray*arr= [strResult componentsSeparatedByString:@"CON_SUCCESS_ALL"];
        NSRange range= [strResult rangeOfString:CON_SUCCESS_ALL];
        range.location+=range.length;
        range.length=@"PBW364JCX3".length;
        NSString*subContent=[strResult substringFromIndex:range.location];
        //NSRange leftCRange= [subContent rangeOfString:@"["];
        NSString*cerName=  [subContent substringToIndex:range.length];
        result.result=cerName;
        
        
        //        if (!(arr&&arr.count==2)) {
        //            result.result=RES_FAIL_TO_GET_CERNAME;
        //            result.isRunSucceed=false;
        //            result.resultReason=SResultFastlaneCerReason_Unknown;
        //        }
        //        else{
        //            NSString*subContent=arr[1];
        //            NSRange leftCRange= [subContent rangeOfString:@"["];
        //            NSString*cerName=  [subContent substringToIndex:leftCRange.location];
        //            result.result=cerName;
        //        }
        //        NSLog(@"last--%@",arr[arr.count-1]);
    }
    
    return result;
}
@end

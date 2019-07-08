//
//  CertProccessTool.m
//  AutoCreateCer
//
//  Created by SSS on 2019/7/4.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "CertProccessTool.h"
#import "CertProccessResultHandler.h"
#import "SFileTool.h"

#define RES_NO_CER @"can't find cer on the local path after the script run"


@implementation CertProccessTool

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler=[CertProccessResultHandler new];
    }
    return self;
}

-(ProccessResult*)doWorkWithAccount:(NSString*)account outputPath:(NSString*)outputPath fastlanePath:(NSString*)fastlanePath{
    NSString *content=[NSString stringWithFormat:@"%@%@",FASTLANE_ENV,
                       @"ACCOUNT=$1;\
                       OUTPUTPATH=$2;\
                       FASTLANE=$3;\
                       ${FASTLANE} run cert username:\"${ACCOUNT}\" output_path:\"${OUTPUTPATH}\""];
    
    content=[content stringByReplacingOccurrencesOfString:@"$1" withString:account];
    content=[content stringByReplacingOccurrencesOfString:@"$2" withString:outputPath];
    content=[content stringByReplacingOccurrencesOfString:@"$3" withString:fastlanePath];
    NSString*result=[self doWork:content];
    ProccessResult*pResult= [self.resultHandler handleResultFromOrinalResult:result];
    if (pResult.resultReason!=SResultFastlaneCerReason_AllSuccess) {
        return pResult;
    }
    //再验证一下目标地址是否有文件
    sleep(1);
    NSString*cerPath=[[outputPath stringByAppendingPathComponent:pResult.result] stringByAppendingString:@".cer"];
    if (![SFileTool isFileExist:cerPath]) {
        pResult.isRunSucceed=false;
        pResult.resultReason=SResultFastlaneCerReason_NoCerAfterRun;
        pResult.result=RES_NO_CER;
    }
    return pResult;
}

@end

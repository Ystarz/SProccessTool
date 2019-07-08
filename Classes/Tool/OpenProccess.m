//
//  OpenProccess.m
//  PackTest_App2
//
//  Created by SSS on 2019/7/8.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "OpenProccess.h"
#import "FastlaneConfig.h"

@implementation OpenProccess
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler=[BaseProccessResultHandler new];
    }
    return self;
}

-(ProccessResult*)doWorkWithfilePath:(NSString*)filePath{
    NSString *content=[NSString stringWithFormat:@"%@%@",FASTLANE_ENV,
                       @"FILETPATH=$1;\
                       open \"${FILETPATH}\" &"];
    content=[content stringByReplacingOccurrencesOfString:@"$1" withString:filePath];
    NSString*result=[self doWorkOnType:SProccessTypeShell WithContent:content];
    ProccessResult*pResult= [self.resultHandler handleResultFromOrinalResult:result];
    if (pResult.resultReason!=SResultReason_AllSuccess&&pResult.resultReason!=SResultReason_Empty) {
        return pResult;
    }
    if (pResult.resultReason==SResultReason_Empty) {
        pResult.isRunSucceed=true;
    }
    return pResult;
}
@end

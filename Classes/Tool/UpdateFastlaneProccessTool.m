//
//  UpdateFastlaneProccessTool.m
//  SProccessTool
//
//  Created by SSS on 2019/9/26.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "UpdateFastlaneProccessTool.h"
@implementation UpdateFastlaneProccessResultHandler

-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult{
    ProccessResult*result=[ProccessResult new];
    //基类,父类永远只判断失败的情况,除非到具体类必须该条件才成立
    [result setOriginalResult:oriResult];
    [result setIsRunSucceed:true];
    [result setResultReason:SResultReason_AllSuccess];
    [result setResult:ALL_SUCCESS];
    
//    //结果是否为空
//    if ([NSString isNull:oriResult]) {
//        [result setIsRunSucceed:true];
//        [result setResultReason:SResultReason_Empty];
//        [result setResult:NO_RESULT];
//    }
//    //结果是否包含明显的失败信息
//    //    if ([oriResult containsString:@"fail"]||[oriResult containsString:@"error"]) {
//    if ((([oriResult containsString:@"fail"]&&![oriResult containsString:@"nw_path_close_fd Failed to close"])||[oriResult containsString:@"error"])&&![oriResult containsString:@"success"]&&![oriResult containsString:@"Success"]) {
//        [result setIsRunSucceed:false];
//        [result setResultReason:SResultReason_Unknown];
//        [result setResult:FAIL_RESULT];
//    }
    return result;
}


@end

@implementation UpdateFastlaneProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler=[UpdateFastlaneProccessResultHandler new];
    }
    return self;
}
-(ProccessResult*)doWorkWithExpPath:(NSString*)toolPath pwd:(NSString*)pwd{
    NSString *shellContent=[NSString stringWithFormat:@"%@",
                       @"`sudo gem install fastlane`"];
    NSString *content=[NSString stringWithFormat:@"%@",
                       @"PWD=$1;\
                       TOOLPATH=$2;\
                       SHELL='$3';\
                       expect ${TOOLPATH} \"${SHELL}\" ${PWD}"];
    
    content=[content stringByReplacingOccurrencesOfString:@"$1" withString:pwd];
    content=[content stringByReplacingOccurrencesOfString:@"$2" withString:toolPath];
    content=[content stringByReplacingOccurrencesOfString:@"$3" withString:shellContent];
//    OCLOGD(@"%@",content);
    NSLog(@"UpdateFastlaneProccessTool::content::%@",content);
    NSString*result= [self doWork:content];
    NSLog(@"UpdateFastlaneProccessTool::%@",result);
    return [self.resultHandler handleResultFromOrinalResult:result];
}
@end

//
//  UpdateProfileProccessTool.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "UpdateProfileProccessTool.h"
#import "UpdateProfileProccessResultHandler.h"
//#import "../Handler/UpdateProfileProccessResultHandler.h"
@implementation UpdateProfileProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setResultHandler:[UpdateProfileProccessResultHandler new]];
    }
    return self;
}
-(ProccessResult*)doWorkWithPackPath:(NSString*)packPath fastlanePath:(NSString*)fastlanePath{
    NSString *content=[NSString stringWithFormat:@"%@%@",FASTLANE_ENV,
                       @"PACKPATH=$1;\
                       FASTLANE=$2;\
                       cd ${PACKPATH};\
                       ${FASTLANE} adhoc_profile"];
    content=[content stringByReplacingOccurrencesOfString:@"$1" withString:packPath];
    content=[content stringByReplacingOccurrencesOfString:@"$2" withString:fastlanePath];
    NSString*result=[self doWork:content];
    return [self.resultHandler handleResultFromOrinalResult:result];
}
@end

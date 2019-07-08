//
//  CreateAppIdProccessTool.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "CreateAppIdProccessTool.h"
#import "CreateAppIdProccessResultHandler.h"
//#import "../Handler/CreateAppIdProccessResultHandler.h"
@implementation CreateAppIdProccessTool

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler=[CreateAppIdProccessResultHandler new];
    }
    return self;
}

-(ProccessResult*)doWorkWithPackPath:(NSString*)packPath fastlanePath:(NSString*)fastlanePath{
    NSString *content=[NSString stringWithFormat:@"%@%@",FASTLANE_ENV,
                       @"PACKPATH=$1;\
                       FASTLANE=$2;\
                       cd ${PACKPATH};\
                       ${FASTLANE} create_appid"];
    content=[content stringByReplacingOccurrencesOfString:@"$1" withString:packPath];
    content=[content stringByReplacingOccurrencesOfString:@"$2" withString:fastlanePath];
    NSString*result= [self doWork:content];
    return [self.resultHandler handleResultFromOrinalResult:result];
}

-(NSString *)doWork:(NSString *)content{
    return [super doWork:content];
}
@end

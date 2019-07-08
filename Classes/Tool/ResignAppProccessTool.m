//
//  ResignAppProccessTool.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ResignAppProccessTool.h"
//#import "../Handler/ResignAppProccessResultHandler.h"
#import "ResignAppProccessResultHandler.h"
@implementation ResignAppProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setResultHandler:[ResignAppProccessResultHandler new] ];
    }
    return self;
}

- (ProccessResult *)doWorkWithShellPath:(NSString *)shellPath ipaPath:(NSString *)ipaPath teamName:(NSString *)teamName mobileProvisionPath:(NSString *)mobileprovisionPath outputIPAPath:(NSString *)outputIPAPath plistPath:(NSString *)plistPath{
    
    teamName=[NSString stringWithFormat:@"\"%@\"",teamName];
    NSString* plistName=[plistPath lastPathComponent];
    NSString*content=@"TOOLPATH=$1;\
    INPUT_IPANAME=$2;\
    TEAMNAME=$3;\
    MOBILEPROVISION=$4;\
    OUTPUT_IPANAME=$5;\
    PLISTPATH=$6;\
    PLISTNAME=$7;\
    cd ${TOOLPATH};\
    chmod 777 ios_resign_with_ipa;\
    ${TOOLPATH}/ios_resign_with_ipa ${INPUT_IPANAME} \"${TEAMNAME}\" ${MOBILEPROVISION} ${OUTPUT_IPANAME} ${PLISTPATH} ${PLISTNAME}";
    
    content=[content stringByReplacingOccurrencesOfString:@"$1" withString:shellPath];
    content=[content stringByReplacingOccurrencesOfString:@"$2" withString:ipaPath];
    content=[content stringByReplacingOccurrencesOfString:@"$3" withString:teamName];
    content= [content stringByReplacingOccurrencesOfString:@"$4" withString:mobileprovisionPath];
    content= [content stringByReplacingOccurrencesOfString:@"$5" withString:outputIPAPath];
    content= [content stringByReplacingOccurrencesOfString:@"$6" withString:plistPath];
    content= [content stringByReplacingOccurrencesOfString:@"$7" withString:plistName];
    NSString*result=[self doWork:content];
    return [self.resultHandler handleResultFromOrinalResult:result];
}
@end

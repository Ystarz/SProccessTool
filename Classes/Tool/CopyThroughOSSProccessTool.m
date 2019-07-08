//
//  CopyThroughOSSProccessTool.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "CopyThroughOSSProccessTool.h"
#import "CopyThroughOSSProccessResultHandler.h"
//#import "../Handler/CopyThroughOSSProccessResultHandler.h"
@implementation CopyThroughOSSProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setResultHandler:[CopyThroughOSSProccessResultHandler new]];
    }
    return self;
}

- (ProccessResult *)doWorkWithShellPath:(NSString *)shellPath sourcePath:(NSString *)sourcePath to:(NSString *)destinationPath ossConfig:(SOSSDataBean*)ossData{
    NSString *content =  [NSString stringWithFormat:@"TOOLDIR=%@;\
                          INPUTPATH=%@;\
                          OUTPATHPATH=%@;\
                          KEYID=%@;\
                          KEYSECRET=%@;\
                          OSSSERVER=%@;\
                          if [[ \"$INPUTPATH\" != \"\" && \"$OUTPATHPATH\" != \"\" ]];\n \
                          then \
                          cd $TOOLDIR ;\
                          chmod 777 ossutilmac64  ;\
                          ./ossutilmac64 config -i ${KEYID} -k ${KEYSECRET} -e ${OSSSERVER}; \
                          ./ossutilmac64 cp -f ${INPUTPATH} ${OUTPATHPATH};  \
                          fi",shellPath,sourcePath,destinationPath,ossData.accessKeyID,ossData.accessKeySecret,ossData.ossServer];
    NSString*result=[self doWork:content];
    return [self.resultHandler handleResultFromOrinalResult:result];
    
}
@end

//
//  CacheLocalDeviceProccessTool.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "CacheLocalDeviceProccessTool.h"
#import "CacheLocalDeviceProccessResultHandler.h"
#import "SFileTool.h"
//#import "../Handler/CacheLocalDeviceProccessResultHandler.h"
//#import "../../../Classes/File/SFileTool.h"

@implementation CacheLocalDeviceProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler =[CacheLocalDeviceProccessResultHandler new];
    }
    return self;
}

-(ProccessResult*)doWorkWithPackPath:(NSString*)filePath device:(NSString*)device udid:(NSString*)udid{
    NSString*deviceTxt=@"devices.txt";
    NSString *content=@"PACKPATH=$1;\
    DNAME=$2;\
    UDID=$3;\
    DEVICE_TXT_NAME=$4;\
    TEXTPATH=\"${PACKPATH}/${DEVICE_TXT_NAME}\";\
    if [[ ${DNAME} != \"\" && ${UDID} != \"\" ]]; then\
    if [ -f \"${TEXTPATH}\" ];then\
    rm -f ${TEXTPATH};\
    echo \"delete old device file\";\
    else\
    echo \"no file exist\";\
    fi;\
    if [ -f \"${TEXTPATH}\" ];then\
    echo \"fail to delete\";\
    else\
    echo \"start to write in\";\
    cat>${TEXTPATH}<<EOFEOF;\
    echo  \"Device ID\\tDevice Name\" > ${TEXTPATH};\
    fi;\
    echo  \"${UDID}\\t${DNAME}\" >> ${TEXTPATH};\
    echo \"run succeed\";\
    else\
    echo \"error paras\";\
    fi";
    content=[content stringByReplacingOccurrencesOfString:@"$1" withString:filePath];
    content=[content stringByReplacingOccurrencesOfString:@"$2" withString:device];
    content=[content stringByReplacingOccurrencesOfString:@"$3" withString:udid];
    content=[content stringByReplacingOccurrencesOfString:@"$4" withString:deviceTxt];
    NSString *result= [self doWork:content];
    ProccessResult* pResult=[self.resultHandler handleResultFromOrinalResult:result];
    
    //其实这一步补充的步骤并没有校验..
    if(pResult.isRunSucceed){
        //不知道为啥shell执行转义字符生效了,但是mac执行不生效,在oc里重新处理转义
        filePath=[NSString stringWithFormat:@"%@/%@",filePath,deviceTxt];
        NSArray*txtArr=[SFileTool getTextArrFromFile:filePath];
        //获取NSArray类型对象的迭代器
        //    NSEnumerator *arrayEnumerator = [txtArr objectEnumerator];
        //    NSString *tempStr;
        NSMutableArray*newArr=[NSMutableArray new ];
        for (int i=0; i<txtArr.count ;i++) {
            NSString*tempStr=txtArr[i];
            if ([tempStr containsString:@"\\t"]) {
                [newArr addObject: [txtArr[i] stringByReplacingOccurrencesOfString:@"\\t" withString:@"\t"]];
            }
            else{
                if(![NSString isNull:tempStr]){
                    [newArr addObject:tempStr];
                }
            }
        }
        NSString*outFilePath=filePath;
        [SFileTool writeToFile:outFilePath contentArr:newArr];
        //NSLog(@"update local device by oc");
    }
    return pResult;
}

-(NSString *)doWork:(NSString *)content{
    return [super doWork:content];
}


@end

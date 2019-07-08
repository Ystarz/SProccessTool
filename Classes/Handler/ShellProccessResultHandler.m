//
//  ShellProccessResultHandler.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ShellProccessResultHandler.h"

@implementation ShellProccessResultHandler

-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult{
    ProccessResult*result=[super handleResultFromOrinalResult:oriResult];
    //判断父类处理结果,失败结果直接返回,成功结果继续分析
    if (!result.isRunSucceed) {
        return result;
    }
    
   //基类,父类永远只判断失败的情况,除非到具体类必须该条件才成立
    return result;
}
@end

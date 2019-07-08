//
//  BaseProccessTool.m
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "BaseProccessTool.h"
#import "NSTask+TRTaskAdditions_termination.h"
//#import "../NSTask+TRTaskAdditions_termination.h"

@implementation BaseProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.task_timeout=20;
    }
    return self;
}

-(NSString*)doWorkOnType:(SProccessType)type WithContent:(NSString*)content{
    // 初始化并设置shell路径
    NSTask *task = [[NSTask alloc] init];
    NSString*launchPath=@"/bin/bash";
    switch (type) {
        case SProccessTypeShell:
            launchPath=@"/bin/bash";
            break;
        case SProccessTypeRuby:
            launchPath=@"/usr/bin/ruby";
            break;
        case SProccessTypeExpect:
            launchPath=@"/usr/bin/expect";
            break;
        default:
            launchPath=@"/bin/bash";
            break;
    }
    [task setLaunchPath: launchPath];
    // -c 用来执行string-commands（命令字符串），也就说不管后面的字符串里是什么都会被当做shellcode来执行
    NSArray *arguments = [NSArray arrayWithObjects: @"-c", content, nil];
    [task setArguments: arguments];
    
    // 新建输出管道作为Task的输出
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    // 开始task
    NSFileHandle *file = [pipe fileHandleForReading];
    
    [task launch];
    [task waitUntilExitWithTimeout:self.task_timeout sendTerm:YES sendKill:YES];
    
    // 获取运行结果
    NSData *data = [file readDataToEndOfFile];
    NSString*result= [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    //OCLOG(@"%@---doShell--result---%@",content,result);
    [task terminate];
    //DoResult doResult= [ShellResultHandler handleShellResult:result];
    
    
    return result;
}
@end

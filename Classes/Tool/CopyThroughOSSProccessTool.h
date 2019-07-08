//
//  CopyThroughOSSProccessTool.h
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ShellProccessTool.h"
#import "SOSSDataBean.h"
NS_ASSUME_NONNULL_BEGIN

@interface CopyThroughOSSProccessTool : ShellProccessTool
-(ProccessResult*)doWorkWithShellPath:(NSString*)shellPath sourcePath:(NSString*)sourcePath to:(NSString*)destinationPath ossConfig:(SOSSDataBean*)ossData;
@end

NS_ASSUME_NONNULL_END

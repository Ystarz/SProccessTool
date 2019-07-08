//
//  FastlaneShellProccessTool.h
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShellProccessTool.h"
#import "FastlaneConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface FastlaneProccessTool : ShellProccessTool
-(NSString*)doWork:(NSString*)content;
@end

NS_ASSUME_NONNULL_END

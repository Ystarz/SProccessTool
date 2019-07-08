//
//  ResignAppProccessTool.h
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ShellProccessTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResignAppProccessTool : ShellProccessTool
-(ProccessResult*)doWorkWithShellPath:(NSString*)shellPath ipaPath:(NSString*)ipaPath teamName:(NSString*)teamName mobileProvisionPath:(NSString*)mobileprovisionPath outputIPAPath:(NSString*)outputIPAPath plistPath:(NSString*)plistPath;
@end

NS_ASSUME_NONNULL_END

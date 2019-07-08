//
//  OpenProccess.h
//  PackTest_App2
//
//  Created by SSS on 2019/7/8.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ShellProccessTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenProccess : ShellProccessTool
-(ProccessResult*)doWorkWithfilePath:(NSString*)filePath;
@end

NS_ASSUME_NONNULL_END

//
//  CacheLocalDeviceProccessTool.h
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ShellProccessTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface CacheLocalDeviceProccessTool : ShellProccessTool
-(ProccessResult*)doWorkWithPackPath:(NSString*)filePath device:(NSString*)device udid:(NSString*)udid;
@end

NS_ASSUME_NONNULL_END

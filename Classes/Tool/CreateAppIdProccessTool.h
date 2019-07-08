//
//  CreateAppIdProccessTool.h
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FastlaneProccessTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface CreateAppIdProccessTool : FastlaneProccessTool

-(ProccessResult*)doWorkWithPackPath:(NSString*)packPath fastlanePath:(NSString*)fastlanePath;
@end

NS_ASSUME_NONNULL_END

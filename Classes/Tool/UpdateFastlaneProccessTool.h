//
//  UpdateFastlaneProccessTool.h
//  SProccessTool
//
//  Created by SSS on 2019/9/26.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <SProccessTool/SProccessTool.h>

NS_ASSUME_NONNULL_BEGIN
@interface UpdateFastlaneProccessResultHandler : FastlaneProccessResultHandler

@end

@interface UpdateFastlaneProccessTool : FastlaneProccessTool
-(ProccessResult*)doWorkWithExpPath:(NSString*)toolPath pwd:(NSString*)pwd;
@end

NS_ASSUME_NONNULL_END

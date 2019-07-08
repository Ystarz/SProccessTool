//
//  CertProccessTool.h
//  AutoCreateCer
//
//  Created by SSS on 2019/7/4.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "FastlaneProccessTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface CertProccessTool : FastlaneProccessTool
-(ProccessResult*)doWorkWithAccount:(NSString*)account outputPath:(NSString*)outputPath fastlanePath:(NSString*)fastlanePath;
@end

NS_ASSUME_NONNULL_END

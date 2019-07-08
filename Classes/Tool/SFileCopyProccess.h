//
//  SFileCopyProccess.h
//  SDataTools
//
//  Created by SSS on 2019/7/5.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "SOCProccess.h"
NS_ASSUME_NONNULL_BEGIN

@interface SFileCopyProccess : SOCProccess

-(ProccessResult*)doWorkWithSourcePath:(NSString*)source toDestination:(NSString*)des;
@end

NS_ASSUME_NONNULL_END

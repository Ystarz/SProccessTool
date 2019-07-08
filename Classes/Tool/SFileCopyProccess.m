//
//  SFileCopyProccess.m
//  SDataTools
//
//  Created by SSS on 2019/7/5.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "SFileCopyProccess.h"
#import "SFileCopyResultHandler.h"

@implementation SFileCopyProccess
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler=[SFileCopyResultHandler new];
    }
    return self;
}

-(ProccessResult*)doWorkWithSourcePath:(NSString*)source toDestination:(NSString*)des{
    return [ProccessResult new];
}



@end

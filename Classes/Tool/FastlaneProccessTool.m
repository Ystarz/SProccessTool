//
//  FastlaneShellProccessTool.m
//  SDataToolsLib_Mac
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "FastlaneProccessTool.h"
#import "FastlaneProccessResultHandler.h"

@implementation FastlaneProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler=[BaseProccessResultHandler new];
    }
    return self;
}

-(NSString*)doWork:(NSString*)content{
    return [super doWork:content];
}
@end

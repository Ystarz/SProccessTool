//
//  ShellProccessTool.m
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ShellProccessTool.h"
#import "ShellProccessResultHandler.h"

@implementation ShellProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler=[ShellProccessResultHandler new];
    }
    return self;
}
-(NSString*)doWork:(NSString*)content{
   return [super doWorkOnType:SProccessTypeShell WithContent:content];
}

@end

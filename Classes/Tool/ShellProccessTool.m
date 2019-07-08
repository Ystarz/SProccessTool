//
//  ShellProccessTool.m
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "ShellProccessTool.h"

@implementation ShellProccessTool
-(NSString*)doWork:(NSString*)content{
   return [super doWorkOnType:SProccessTypeShell WithContent:content];
}

@end

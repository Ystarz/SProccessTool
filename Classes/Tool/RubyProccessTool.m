//
//  RubyProccessTool.m
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "RubyProccessTool.h"

@implementation RubyProccessTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultHandler=[BaseProccessResultHandler new];
    }
    return self;
}
-(NSString*)doWork:(NSString*)content{
   return [super doWorkOnType:SProccessTypeRuby WithContent:content];
}

-(ProccessResult*)doWork2:(NSString*)content{
    NSString*result= [self doWork:content];
   return [self.resultHandler handleResultFromOrinalResult:result];
}
@end

//
//  RubyProccessTool.h
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "BaseProccessTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface RubyProccessTool : BaseProccessTool
-(NSString*)doWork:(NSString*)content;
-(ProccessResult*)doWork2:(NSString*)content;
@end

NS_ASSUME_NONNULL_END

//
//  ShellProccessTool.h
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProccessTool.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShellProccessTool :BaseProccessTool
-(NSString*)doWork:(NSString*)content;
@end

NS_ASSUME_NONNULL_END

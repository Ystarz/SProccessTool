//
//  BaseProccessResultHandler.h
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "../Model/BaseProccessResult.h"
//#import "../Model/ProccessResult.h"
//#import "../../../Classes/Data/SNSStringTool.h"
#import "ProccessResult.h"
#import "SNSStringTool.h"

#define NO_RESULT @"No Result After Proccess Run!"
#define ALL_SUCCESS @"Success After Proccess Run!"

NS_ASSUME_NONNULL_BEGIN

@interface BaseProccessResultHandler : NSObject


-(ProccessResult*)handleResultFromOrinalResult:(NSString*)oriResult;
@end

NS_ASSUME_NONNULL_END

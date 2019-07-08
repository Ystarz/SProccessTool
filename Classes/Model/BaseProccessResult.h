//
//  BaseProccessResult.h
//  SDataTools
//
//  Created by SSS on 2019/6/29.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProccessResult.h"
#import "SResultEnums.h"

NS_ASSUME_NONNULL_BEGIN
//typedef enum
//{
//    DoResultSuccess = 0,  //成功
//    DoResultFail,  //失败
//} DoResult;



@interface BaseProccessResult : NSObject
@property (strong,nonatomic) NSString* originalResult;
@property(assign,nonatomic) bool isRunSucceed;
@property(assign,nonatomic) int resultReason;
@property (strong,nonatomic) NSString*result;
@end

NS_ASSUME_NONNULL_END

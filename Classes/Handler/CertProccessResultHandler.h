//
//  CertProccessResultHandler.h
//  AutoCreateCer
//
//  Created by SSS on 2019/7/4.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "FastlaneProccessResultHandler.h"

NS_ASSUME_NONNULL_BEGIN
typedef enum
{
    
    SResultFastlaneCerReason_AllSuccess=0,
    SResultFastlaneCerReason_Unknown,//未知错误
    SResultFastlaneCerReason_NeedUpdate,//fastlane需要更新
    SResultFastlaneCerReason_NoAccountAndNeedInputPassword,//没有该appleid,并且需要输入密码
    SResultFastlaneCerReason_AccountWithWrongPassword,//有该appleid,但密码是错的
    SResultFastlaneCerReason_NeedTwicePassword,//需要该appleid的二次验证码
    SResultFastlaneCerReason_FailToLogin,//登陆苹果账号超时,通常是503
    SResultFastlaneCerReason_LocalCerExist,//钥匙库已存在cer证书
    SResultFastlaneCerReason_MaxCers,//该账户可创建的cer证书数量达到上限
    SResultFastlaneCerReason_NoCerAfterRun,//本地没有找到可用的cer证书
} SResultFastlaneCerReason;

@interface CertProccessResultHandler : FastlaneProccessResultHandler

@end

NS_ASSUME_NONNULL_END

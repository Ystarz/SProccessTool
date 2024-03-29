//
//  ResultEnums.h
//  SDataTools
//
//  Created by SSS on 2019/6/30.
//  Copyright © 2019 SSS. All rights reserved.
//

#ifndef ResultEnums_h
#define ResultEnums_h
typedef enum
{
    SResultReason_AllSuccess=0,
    SResultReason_Unknown,//未知错误
    SResultReason_Empty,//结果为空,默认归为正确吧?
} SResultReason;


typedef enum
{
    
    SResultFastlaneReason_AllSuccess=0,
    SResultFastlaneReason_Unknown,//未知错误
    SResultFastlaneReason_NeedUpdate,//fastlane需要更新
    SResultFastlaneReason_NoAccount,//没有该appleid
    SResultFastlaneReason_NoAccountAndNeedInputPassword,//没有该appleid,并且需要输入密码
    SResultFastlaneReason_AccountWithWrongPassword,//有该appleid,但密码是错的
    SResultFastlaneReason_NeedTwicePassword,//需要该appleid的二次验证码
    SResultFastlaneReason_FailToUpload,
    SResultFastlaneReason_FailToLogin,//登陆苹果账号超时,通常是503
    SResultFastlaneReason_NeedUpdateLicense,//需要登录开发者网站同意新协议
} SResultFastlaneReason;


#endif /* ResultEnums_h */

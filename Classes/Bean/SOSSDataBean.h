//
//  HMOSSDataBean.h
//  PackTest_App2
//
//  Created by SSS on 2019/6/12.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SOSSDataBean : NSObject
@property (strong,nonatomic) NSString*accessKeyID;
@property (strong,nonatomic) NSString*accessKeySecret;
@property (strong,nonatomic) NSString*ossServer;
@property (strong,nonatomic) NSString*plistUrlPrefix;
@end

NS_ASSUME_NONNULL_END

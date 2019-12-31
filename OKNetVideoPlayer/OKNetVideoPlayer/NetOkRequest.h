//
//  NetOkRequest.h
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/30.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetOkRequest : NSObject

+ (instancetype)sharedNetWorkReq;

- (void)baseRequest_GET:(NSString*)url para:(NSDictionary*)para succ:(void (^)(id result))succ faliar:(void (^)(NSError* err))faliar;

- (void)baseRequest_POST:(NSString*)url para:(NSDictionary*)para succ:(void (^)(id result))succ faliar:(void (^)(NSError* err))faliar;

@end

NS_ASSUME_NONNULL_END

//
//  NetfrontPageReq.h
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/30.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import "NetOkRequest.h"

NS_ASSUME_NONNULL_BEGIN
@interface VideoPlayModel : NSObject
@property (nonatomic,strong) NSString *videoName;
@property (nonatomic,strong) NSString *videoPlayUrl;

@end

@interface NetfrontPageReq : NetOkRequest

+ (void)apiRequestSearch:(NSDictionary*)dic succ:(void (^)(id result))succ faliar:(void (^)(NSError* err))faliar;

@end

NS_ASSUME_NONNULL_END

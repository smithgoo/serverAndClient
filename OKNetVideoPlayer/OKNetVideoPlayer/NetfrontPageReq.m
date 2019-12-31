//
//  NetfrontPageReq.m
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/30.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import "NetfrontPageReq.h"
#import <MJExtension.h>
@implementation VideoPlayModel

@end

@implementation NetfrontPageReq
+ (void)apiRequestSearch:(NSDictionary*)dic succ:(void (^)(id result))succ faliar:(void (^)(NSError* err))faliar {
    NSString *url =[NSString stringWithFormat:@"%@%@",@"http://192.168.0.16:5000/",@"searchReq"];
    [[self sharedNetWorkReq] baseRequest_GET:url para:dic succ:^(id  _Nonnull result) {
        NSArray *xx =result[0];
        NSArray <VideoPlayModel*> *modelarr= [VideoPlayModel mj_objectArrayWithKeyValuesArray:xx];
        succ(modelarr);
    } faliar:^(NSError * _Nonnull err) {
        faliar(err);
    }];
}
@end

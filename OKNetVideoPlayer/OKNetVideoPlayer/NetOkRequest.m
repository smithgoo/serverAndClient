//
//  NetOkRequest.m
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/30.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import "NetOkRequest.h"
#import <AFNetworking.h>
@interface NetOkRequest ()

@property (nonatomic,strong) AFHTTPSessionManager *mag;
@end
@implementation NetOkRequest


+ (instancetype)sharedNetWorkReq {
    static NetOkRequest *_NetOkRequest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //不能再使用alloc方法
        //因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法
        _NetOkRequest = [[super allocWithZone:NULL] init];
        [_NetOkRequest initNetWork];
        
    });
    return _NetOkRequest;
}

- (void) initNetWork {
    _mag =[AFHTTPSessionManager manager];
    _mag = [AFHTTPSessionManager manager];
    _mag.requestSerializer.HTTPShouldHandleCookies = YES;
    _mag.requestSerializer  = [AFHTTPRequestSerializer serializer];
    _mag.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //将客户端传的body为json数据，这样服务器收到的参数就是json
    _mag.requestSerializer = [AFJSONRequestSerializer serializer];
    [_mag.requestSerializer setTimeoutInterval:60];
    
    _mag.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
    [_mag.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
}

- (void)baseRequest_GET:(NSString*)url para:(NSDictionary*)para succ:(void (^)(id result))succ faliar:(void (^)(NSError* err))faliar {
    [_mag GET:url parameters:para success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             id x = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([x isKindOfClass:[NSDictionary class]]) {
            NSLog(@"%@",x);
        } else if ([x isKindOfClass:[NSArray class]]) {
            NSLog(@"%@",x);
        }
        succ(x);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        faliar(error);
    }];

}

- (void)baseRequest_POST:(NSString*)url para:(NSDictionary*)para succ:(void (^)(id result))succ faliar:(void (^)(NSError* err))faliar {
   [_mag POST:url parameters:para success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             id x = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([x isKindOfClass:[NSDictionary class]]) {
            NSLog(@"%@",x);
        } else if ([x isKindOfClass:[NSArray class]]) {
            NSLog(@"%@",x);
        }
       succ(x);
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       faliar(error);
    }];

}






@end

//
//  OKVideoPlayerViewController.m
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/31.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import "OKVideoPlayerViewController.h"
#import <KPIjkVideoView.h>
@interface OKVideoPlayerViewController ()<KPIjkVideoViewDelegate,KPIjkVideoToolsDelegate>
@property (nonatomic,strong) KPIjkVideoView *videoPlayer;

@end

@implementation OKVideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    [self initWebData];
    
}

- (void)initWebData {
        _videoPlayer = [[KPIjkVideoView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.width*9/16) delegate:self playUrl:self.url title:self.titleStr];
        [self.view addSubview:_videoPlayer];
    
}



- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden =YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}




- (void)playerBackAction {
if (!_videoPlayer.isFullScreen) {
    [self.navigationController popViewControllerAnimated:YES];
} else {
    [_videoPlayer videoPlayrotateAction:NO];
}

}

- (void)exchangeAction:(UIButton*)sender {
[_videoPlayer exChangePlayMthod];
}

#pragma mark -与全屏相关的代理方法等

- (void)videoScreenFullScreenOrNot:(BOOL)isFullScreen {
[_videoPlayer videoPlayrotateAction:isFullScreen];
}

#pragma mark------ijk 播放的代理方法

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator{

if ([UIDevice currentDevice].orientation ==UIDeviceOrientationLandscapeLeft||[UIDevice currentDevice].orientation ==UIDeviceOrientationLandscapeRight){
    UIWindow*window= [UIApplication sharedApplication].keyWindow;
    _videoPlayer.frame=CGRectMake(0, 0, size.width,size.height);
    _videoPlayer.player.view.frame=CGRectMake(0, 0, size.width,size.height);
    _videoPlayer.isFullScreen=YES;
    _videoPlayer.toolsView.isFullScreen =YES;
    [window addSubview:_videoPlayer];
  
}else{
//        if (KIsiPhoneX||KIsiPhoneXR||KIsiPhoneXS||KIsiPhoneXS_MAX) {
//            _playerView.frame=CGRectMake(0, 30, size.width, size.width/16*9);
//            _playerView.player.view.frame=CGRectMake(0, 30, size.width, size.width/16*9);
//        } else {
        _videoPlayer.frame=CGRectMake(0, 0, size.width, size.width/16*9);
        _videoPlayer.player.view.frame=CGRectMake(0, 0, size.width, size.width/16*9);
//        }
    _videoPlayer.isFullScreen=NO;
    _videoPlayer.toolsView.isFullScreen =NO;
     [self.view addSubview:_videoPlayer];
  
}

}



@end

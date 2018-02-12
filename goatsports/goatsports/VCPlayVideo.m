//
//  VCPlayVideo.m
//  goatsports
//
//  Created by 刘浩然 on 1/6/18.
//  Copyright © 2018 刘浩然. All rights reserved.
//

#import "VCPlayVideo.h"

@interface VCPlayVideo ()

@end

@implementation VCPlayVideo

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    // Do any additional setup after loading the view.
    //创建播放器对象，AliyunVodPlayerView继承自UIView，可以创建多实例，提供4套皮肤可设置
    _playerView = [[AliyunVodPlayerView alloc] initWithFrame:CGRectMake(0,20, width, height) andSkin:AliyunVodPlayerViewSkinRed];
    //设置播放器代理
    [_playerView setDelegate:self.view];
    //将播放器添加到需要展示的界面上
    [self.view addSubview:_playerView];
    NSURL *url = [NSURL
                  URLWithString:@"http://47.94.135.66/AceTennis/C000001C001V01/1033.flv"];//网络视频，填写网络url地址
    [self.playerView playViewPrepareWithURL:url];
    [self.playerView start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onBackViewClickWithAliyunVodPlayerView:(AliyunVodPlayerView*)playerView{
    //点击播放器界面的返回按钮时触发，可以用来处理界面跳转
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onPause:(NSTimeInterval)currentPlayTime{
    //点击播放器界面的暂停按钮时触发，可以用来添加暂定时在界面上添加其他元素，如广告图片等
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onResume:(NSTimeInterval)currentPlayTime{
    //点击播放界面的恢复按钮时触发，可以用来处理界面上额外添加的元素隐藏等功能
}
- (void)onFinishWithAliyunVodPlayerView:(AliyunVodPlayerView*)playerView{
    //播放完成事件，与stop不同，指视频正常播放完成。
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onStop:(NSTimeInterval)currentPlayTime{
    //播放器调用stop时触发
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onSeekDone:(NSTimeInterval)seekDoneTime{
    //播放器Seek完成时触发，可以用来处理界面的UI元素变化
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView lockScreen:(BOOL)isLockScreen{
    //点击界面的锁屏按钮时触发，用来和controller交互锁定事件
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onVideoQualityChanged:(AliyunVodPlayerVideoQuality)quality{
    //当清晰度改变后触发，可以用来处理清晰度发生变化时的UI提醒
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView *)playerView fullScreen:(BOOL)isFullScreen{
    //当出发全屏旋转后出发，用于配合ViewController来展示横屏全屏、竖屏全屏。
}
- (void)onCircleStartWithVodPlayerView:(AliyunVodPlayerView *)playerView{
    //开启循环播放时，循环播放开始接收的事件。
}



/*
#pragma mark - Navigation

 
 
 
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)backMainView:(id)sender{
    NSLog(@"fuck go back");
    //[_delegate backMainView];
    [rootView dismissViewControllerAnimated:YES completion:nil];
    
}

@end

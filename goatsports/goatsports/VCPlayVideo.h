//
//  VCPlayVideo.h
//  goatsports
//
//  Created by 刘浩然 on 1/6/18.
//  Copyright © 2018 刘浩然. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PLPlayerKit/PLPlayerKit.h>

@interface VCPlayVideo : UIViewController<PLPlayerDelegate>
{
    UINavigationController *navPlay;
    IBOutlet UIViewController * rootView;
    IBOutlet UIView * showPlayerView;
    UIView *playerView;
}
//代理对象, 执行协议.
@property (nonatomic, strong) PLPlayer  *player;
@property (nonatomic, weak) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, assign) int reconnectCount;
-(IBAction)Play:(id)sender;
-(IBAction)backMainView:(id)sender;
@end

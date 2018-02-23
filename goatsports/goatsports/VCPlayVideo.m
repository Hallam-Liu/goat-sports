//
//  VCPlayVideo.m
//  goatsports
//
//  Created by 刘浩然 on 1/6/18.
//  Copyright © 2018 刘浩然. All rights reserved.
//

#import "VCPlayVideo.h"
#define enableBackgroundPlay    1
#define SYSTEM_VERSION_EQUAL_TO(v)([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch]==NSOrderedSame)

#define SYSTEM_VERSION_GREATER_THAN(v)([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch]==NSOrderedDescending)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch]!=NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN(v)([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch]==NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch]!=NSOrderedDescending)
static NSString *status[] = {
    @"PLPlayerStatusUnknow",
    @"PLPlayerStatusPreparing",
    @"PLPlayerStatusReady",
    @"PLPlayerStatusCaching",
    @"PLPlayerStatusPlaying",
    @"PLPlayerStatusPaused",
    @"PLPlayerStatusStopped",
    @"PLPlayerStatusError",
    @"PLPlayerStatusCompleted"
};

@interface VCPlayVideo ()
<
PLPlayerDelegate,
UITextViewDelegate
>
@end

@implementation VCPlayVideo


- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
 /*
    PLPlayerOption *option = [PLPlayerOption defaultOption];
    [option setOptionValue:@15 forKey:PLPlayerOptionKeyTimeoutIntervalForMediaPackets];
    NSURL *url = [NSURL URLWithString:@"http://47.94.135.66/AceTennis/C000001C001V01/1033.flv"];
    self.player = [PLPlayer playerWithURL:url option:option];
    self.player.delegate = self;
    
    [self.view addSubview:self.player.playerView];
    [self.player play];
*/
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    PLPlayerOption *option = [PLPlayerOption defaultOption];
    [option setOptionValue:@10 forKey:PLPlayerOptionKeyTimeoutIntervalForMediaPackets];
    NSURL *url = [NSURL URLWithString:@"http://47.94.135.66/AceTennis/C000001C001V01/1033.flv"];

    self.player = [PLPlayer playerWithURL:url option:option];
    self.player.delegate = self;
    self.player.delegateQueue = dispatch_get_main_queue();
    self.player.backgroundPlayEnable = enableBackgroundPlay;
#if !enableBackgroundPlay
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startPlayer) name:UIApplicationWillEnterForegroundNotification object:nil];
#endif
    [self setupUI];
    
    //[self startPlayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tap:(id)sender {
    [self.view endEditing:YES];
}

- (void)setupUI {
    if (self.player.status != PLPlayerStatusError) {
        // add player view
       playerView = self.player.playerView;
        if (!playerView.superview) {
            /*
            playerView.contentMode = UIViewContentModeScaleAspectFit;
        
            playerView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin
            | UIViewAutoresizingFlexibleTopMargin
            | UIViewAutoresizingFlexibleLeftMargin
            | UIViewAutoresizingFlexibleRightMargin
            | UIViewAutoresizingFlexibleWidth
            | UIViewAutoresizingFlexibleHeight;
            */
            playerView.frame = CGRectMake(16, 158, 343, 212);
           
            [self.view addSubview:playerView];
            
            // test input
            UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 80, CGRectGetWidth(self.view.bounds) - 30, 40)];
            textView.delegate = self;
            textView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
            textView.textColor = [UIColor colorWithWhite:1 alpha:0.8];
            textView.text = @"我是 TextView";
            [self.view addSubview:textView];
            
            //start play
            
            UIButton *Beginbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            Beginbutton.frame = CGRectMake(20,30,200,50);
            Beginbutton.center =CGPointMake(CGRectGetMidX(self.player.playerView.bounds), CGRectGetMidY(self.player.playerView.bounds));
            [Beginbutton setTitle:@"Begin" forState:UIControlStateNormal ];
            [Beginbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
           
            [Beginbutton addTarget:self action:@selector(startPlayer) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:Beginbutton];
            
            // button
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(15, 300, 320, 44);
            [button setTitle:@"Full screen" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
         
        }
    }
    
}

- (IBAction)Play:(id)sender{
    NSLog(@"lllhrrrplay");
    
    [self startPlayer];
    
}

- (void)addActivityIndicatorView {
    if (self.activityIndicatorView) {
        return;
    }
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //activityIndicatorView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
     activityIndicatorView.center = CGPointMake(CGRectGetMidX(self.player.playerView.bounds), CGRectGetMidY(self.player.playerView.bounds));
    [self.view addSubview:activityIndicatorView];
    [activityIndicatorView stopAnimating];
    
    self.activityIndicatorView = activityIndicatorView;
}

- (void)startPlayer {
    playerView.contentMode = UIViewContentModeScaleAspectFit;
    
    playerView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleLeftMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleWidth
    | UIViewAutoresizingFlexibleHeight;
    [self addActivityIndicatorView];
    [UIApplication sharedApplication].idleTimerDisabled = YES;
   
    [self.player play];
    
}

#pragma mark - <PLPlayerDelegate>

- (void)player:(nonnull PLPlayer *)player statusDidChange:(PLPlayerStatus)state {
    if (PLPlayerStatusCaching == state) {
        [self.activityIndicatorView startAnimating];
    } else {
        [self.activityIndicatorView stopAnimating];
    }
    NSLog(@"%@", status[state]);
}

- (void)player:(nonnull PLPlayer *)player stoppedWithError:(nullable NSError *)error {
    [self.activityIndicatorView stopAnimating];
    [self tryReconnect:error];
}

- (void)tryReconnect:(nullable NSError *)error {
    if (self.reconnectCount < 3) {
        _reconnectCount ++;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:[NSString stringWithFormat:@"错误 %@，播放器将在%.1f秒后进行第 %d 次重连", error.localizedDescription,0.5 * pow(2, self.reconnectCount - 1), _reconnectCount] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * pow(2, self.reconnectCount) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.player play];
        });
    }else {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
            //判断ios 版本
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                           message:error.localizedDescription
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            __weak typeof(self) wself = self;
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK"
                                                             style:UIAlertActionStyleCancel
                                                           handler:^(UIAlertAction *action) {
                                                               __strong typeof(wself) strongSelf = wself;
                                                               [strongSelf.navigationController performSelectorOnMainThread:@selector(popViewControllerAnimated:) withObject:@(YES) waitUntilDone:NO];
                                                           }];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        [UIApplication sharedApplication].idleTimerDisabled = NO;
        NSLog(@"%@", error);
    }
}


- (void)buttonPressed:(id)sender {
   /*
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    });
    */
    NSLog(@"quanping");
    playerView.frame = [[UIScreen mainScreen]bounds];
    
    [self.view addSubview:playerView];

    
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

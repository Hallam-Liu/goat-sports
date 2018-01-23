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
    
}
//代理对象, 执行协议.
@property (nonatomic, strong) PLPlayer  *player;
-(IBAction)backMainView:(id)sender;
@end

//
//  VCPlayVideo.h
//  goatsports
//
//  Created by 刘浩然 on 1/6/18.
//  Copyright © 2018 刘浩然. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCPlayVideo : UIViewController
{
    UINavigationController *navPlay;
    IBOutlet UIViewController * rootView;
    
}
//代理对象, 执行协议.

-(IBAction)backMainView:(id)sender;
@end

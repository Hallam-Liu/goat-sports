//
//  AppDelegate.h
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    IBOutlet UITextField * userName;
    IBOutlet UITextField * password;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UIView *LoginView;
-(IBAction)login:(id)sender;

@end


//
//  AppDelegate.h
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "FirstViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    IBOutlet UITextField * userName;
    IBOutlet UITextField * password;
    IBOutlet UIViewController *V1;
//@public UINavigationController *nav;
    //SecondViewController *VC;
}
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UIView *loginView;





//@property (strong, nonatomic) UIViewController *Login;
-(IBAction)login:(id)sender;


@end






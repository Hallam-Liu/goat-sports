//
//  AppDelegate.m
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>   
@interface ViewController : UIViewController<UITextFieldDelegate> @end
@interface AppDelegate ()

@end


@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [V1 viewDidLoad];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(IBAction)login:(id)sender{
    NSString *User = userName.text;
    NSString *Password = password.text;
    if ([User isEqual: @"Liuhr"] && [Password  isEqual: @"haoran"])
    {
        NSLog(@"12334");
        
        V1 = [[UIViewController alloc]init];
       V1= [UIApplication sharedApplication].keyWindow.rootViewController;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SecondViewController *VC = [storyboard instantiateViewControllerWithIdentifier:@"MyView"];
        NSLog(@"____%@",storyboard);
        
        //显示新视图控制器
        //VC 新视图控制器对象
        //parameter 2 是否有动画效果。
        //parameter 3 切换结束后功能调用
        NSLog(@"test1234");
        [V1.view.window makeKeyAndVisible];
        [V1 presentViewController:VC animated:YES completion:nil];
        NSLog(@"test222");
     
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK" ];
        [alert setMessage:@"username or password incorrect"];
        [alert setTitle:@"login error"];
        [alert show];
    }
        
}

@end

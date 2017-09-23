//
//  FirstViewController.h
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFHTTPSessionManager.h"
#define requestTime 3000
#pragma mark - 创建请求者
@interface FirstViewController : UIViewController
{
    IBOutlet UITextField * telePhoneNumber;
    IBOutlet UITextField * userName;
    IBOutlet UITextField * passWord;
    IBOutlet UITextField * verifyCode;
    IBOutlet UIProgressView * progress;
}
-(IBAction)sendMessage:(id)sender;
-(IBAction)signUp:(id)sender;
-(void)postmessage:paramater;

// 请求超时的时间
typedef void (^SuccessBlock)(NSDictionary *dict, BOOL success); // 访问成功block
typedef void (^AFNErrorBlock)(NSError *error); // 访问失败block

@end


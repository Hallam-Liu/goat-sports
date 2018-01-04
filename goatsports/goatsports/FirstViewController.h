//
//  FirstViewController.h
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Global.pch"
#import "AFHTTPSessionManager.h"
#define requestTime 3000
#pragma mark - 创建请求者
typedef void (^requestSuccessBlock)(NSDictionary *dic);
typedef void (^requestFailureBlock)(NSError *error);

@interface FirstViewController : UIViewController
{
    IBOutlet UITextField * telePhoneNumber;
    IBOutlet UITextField * userName;
    IBOutlet UITextField * passWord;
    IBOutlet UITextField * verifyCode;
    NSArray *respondArray;
    NSInteger *flag;
    @public NSDictionary * Response;
}
-(IBAction)test:(id)sender;
//宏定义成功block 回调成功后得到的信息
typedef void (^HttpSuccess)(NSDictionary *dic);
//宏定义失败block 回调失败信息
typedef void (^HttpFailure)(NSError *error);
-(IBAction)sendMessage:(id)sender;
-(IBAction)signUp:(id)sender;
-(id)postmessage:(NSDictionary*)dict protal:(NSString*)protal success:(HttpSuccess)success
 failure:(HttpFailure)failure;
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
-(id)changJsonStringfomat:(NSDictionary*)dict;
// 请求超时的时间
-(NSDictionary*)Value;
typedef void (^SuccessBlock)(NSDictionary *dict, BOOL success); // 访问成功block
typedef void (^AFNErrorBlock)(NSError *error); // 访问失败block

@end


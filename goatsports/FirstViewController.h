//
//  FirstViewController.h
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import <UIKit/UIKit.h>

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


@end


//
//  SecondViewController.h
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "VCLike.h"
//#import "Global.pch"
@interface SecondViewController : UIViewController
<UITableViewDataSource,
UITableViewDelegate>
{
    IBOutlet UIViewController *viewController;
    IBOutlet UIToolbar *Toolbar;
    IBOutlet UIView *mainView;
    @public NSDictionary * ResponseTable;
    NSArray* array;
    @public UINavigationController *nav;
    UITableView *tableView;

    UIViewController *ViewLike,*Viewinfo,*ViewMore;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *showtable;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *showInformation;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *showlike;

//@property (strong, nonatomic) IBOutlet UIView *mainView;
//@property (strong, nonatomic) UIWindow *mainwindow;
@end


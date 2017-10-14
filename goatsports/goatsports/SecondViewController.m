//
//  SecondViewController.m
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)showMainwindow{
    
        mainview=[[SecondViewController alloc]init];
        //mainview.delegate=self;//设置代理
        //调用此方法显示模态窗口
    [self viewDidLoad];
    [self viewDidAppear:YES];
    [self.view center];
    return 0;
    }
//    else{
//        //如果登录之后则处理注销的情况
//        //注意当前视图控制器必须实现UIActionSheet代理才能进行操作
//        UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"系统信息" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles: nil];
//        [actionSheet showInView:self.view];
//    }]


@end

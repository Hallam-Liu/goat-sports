//
//  SecondViewController.m
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "AppDelegate.h"
NSDictionary *dict;
@interface SecondViewController ()

@end

@implementation SecondViewController

FirstViewController *Data;

- (void)viewDidLoad {
    //定义nav，tabbar
    self.view.backgroundColor = [UIColor greenColor];
    
    //当前界面的导航栏，tabbar标题
    nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    nav.title =@"球馆";
    UILabel *navtitle ;
    navtitle.text=@"球馆";
    nav.navigationBar.topItem.titleView = navtitle;
    [self.view.window addSubview:nav.view];
    nav.view.backgroundColor = [UIColor whiteColor];
   
    //收藏界面
    VCLike *VClike = [[VCLike alloc]init];
    VClike.title = @"收藏";
    VClike.view.backgroundColor = [UIColor blueColor];
    
    //更多界面
    VCMore *VCmore = [[VCMore alloc]init];
    VCmore.title = @"更多";
    VCmore.view.backgroundColor = [UIColor greenColor];
    
    //信息界面
    VCInfo *VCinfo = [[VCInfo alloc]init];
    VCinfo.title = @"信息";
    VCinfo.view.backgroundColor = [UIColor yellowColor];
    
    
    //tabar定义，数组
    controllerArray = [NSArray arrayWithObjects:nav,VClike,VCmore,VCinfo, nil];
    tab = [[UITabBarController alloc]init];
    tab.viewControllers = controllerArray;
    self.view.window.rootViewController = tab;
    tab.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tab.view];
    //tab.delegate = self;
    //tab.selectedIndex=1;
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;    
    CGFloat height = size.height;
    //球馆页面tableview
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60,size.width, size.height-120) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource=self;
  
    //通信字典，发送服务器字符串获取返回值
    NSDictionary *firstPage = @{@"city_id":@"0"};
    Data = [[FirstViewController alloc]init];
        [Data postmessage:firstPage protal:@"20201" success:^(NSDictionary *dic){
            dispatch_async(dispatch_get_main_queue(), ^{
                //回调或者说是通知主线程刷新，
                for (NSString *s in [Data->Response allValues]) {
                    NSLog(@"why cannot go backSecvalue: %@", s);
                }
                [nav.view addSubview:tableView];
                [tableView reloadData];
            });

        } failure:^(NSError*error){
            NSLog(@"add tableViewerror%@",error);
            
            
        }];
    
   
  [self.view.window makeKeyAndVisible];
    
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellStr"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellStr"];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSLog(@"wtfffff%lu",(unsigned long)[Data->Response count]);
    for (NSString *s in [Data->Response  allValues]) {
        NSLog(@"fuckyou Secvalue: %@", s);
    }
    NSArray* array = [Data->Response  objectForKey:@"sta_list"];
    NSLog(@"%@",array);
    NSDictionary *item = (NSDictionary *)[array objectAtIndex:indexPath.row];
    NSString* str = [item objectForKey:@"name"];
    
    //NSLog(@"%@",str);
    //NSString *str = @"lllhr";
    
    //cell.textLabel.text = [item objectForKey:@"mainTitleKey"];
    cell.textLabel.text = str;
    NSLog(@"please log %@",str);
    //cell.detailTextLabel.text = [item objectForKey:@"secondaryTitleKey"];
    //NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
    //UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    UIImage *theImage = [UIImage imageNamed:@"testImage.png"];
    cell.imageView.image = theImage;
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
   
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

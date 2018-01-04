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
    NSDictionary *firstPage = @{@"city_id":@"0"};
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;    
    CGFloat height = size.height;
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60,size.width, size.height-120) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource=self;
    self.view.backgroundColor = [UIColor greenColor];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    nav.title =@"球馆";
    [self.view.window addSubview:nav.view];
    nav.view.backgroundColor = [UIColor whiteColor];
    VCLike *VClike = [[VCLike alloc]init];
    VClike.title = @"收藏";
    VClike.view.backgroundColor = [UIColor blueColor];
    NSArray *controllerArray = [NSArray arrayWithObjects:nav,VClike,nil];
    UITabBarController *tab = [[UITabBarController alloc]init];
    tab.viewControllers = controllerArray;
    self.view.window.rootViewController = tab;
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
    
   
   //tab= [UIApplication sharedApplication].keyWindow.rootViewController;
    tab.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tab.view];
    //tab.selectedIndex=1;
  [self.view.window makeKeyAndVisible];
    _showlike = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showliked)];
    _showtable =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showtheMain)];
    _showInformation =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showtheInfo)];
    
}

-(void)updateTableView{
    
}

-(void)showliked{
    //[self.view addSubview:InfoView];
    
    
}
-(void)showtheMain{
    

    for (NSString *s in [Data->Response allValues]) {
        NSLog(@"Secvalue: %@", s);
    }
   
   
}

-(void)showtheInfo{
    //[self.view addSubview:LikeView];
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

//- (UIView *)tableView:(UITableView *)tableView viewForTableColumn:(UITableColumn *)tableColumn row:(NSInteger)row   //此方法用于表示view中每行每列所显示的内容。
//{
    
    // Get a new ViewCell
    //NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    //通过makeViewWithIdentifier 得到一个cellView。这里会创建一个基于tableColumn的identifier的cellView。
    // Since this is a single-column table view, this would not be necessary.
    // But it's a good practice to do it in order by remember it when a table is multicolumn.
   /*
    if( [tableColumn.identifier isEqualToString:@"Bugcolumn"] )//Bugcolumn是设置的列标识，这里table view只有一列
    {
        ScaryBugDoc *bugDoc = [self.bugs objectAtIndex:row];
        //对象bugDoc 是scaryBugDOC类中字典bugs相对每行的内容，bugs字典中已经声明存下了虫子数据。
        cellView.imageView.image = bugDoc.thumbImage;
        cellView.textField.stringValue = bugDoc.data.title;
        return cellView;
    }
    return cellView;
    */
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
   
    //viewController.title = @"gfsgw";
}

-(void)viewWillDisappear:(BOOL)animated{
    SecondViewController * Table;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

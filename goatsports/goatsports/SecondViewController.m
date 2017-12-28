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
@interface SecondViewController ()

@end

@implementation SecondViewController

FirstViewController *Data;

- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor= [UIColor whiteColor];
    Toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 623, 376, 400)];
    //Table.delegate =self;
    //Table.dataSource =self;
    [self showtheMain];
    _showlike = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showliked)];
    _showtable =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showtheMain)];
    _showInformation =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showtheInfo)];
    
}

-(void)showliked{
    //[self.view addSubview:InfoView];
    
}
-(void)showtheMain{
     [Table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"haoran"];
    Data = [[FirstViewController alloc]init];
    NSDictionary *firstPage = @{@"city_id":@"0"};
    [Data postmessage:firstPage protal:@"20201" success:^(NSDictionary *dic){
        [Reponse initWithDictionary:dic];} failure:nil ];
    //Reponse = [Data postmessage:firstPage protal:@"20201"];
    [NSThread sleepForTimeInterval:3.0f];
    NSLog(@"llllllllllll");
    NSLog(@"%lu",(unsigned long)[Reponse count]);
    for (NSString *s in [Reponse allValues]) {
        NSLog(@"Secvalue: %@", s);
    }
    [self.view addSubview:Table];
}

-(void)showtheInfo{
    //[self.view addSubview:LikeView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [Table dequeueReusableCellWithIdentifier:@"CellStr"];
    

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellStr"];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray* array = [Reponse objectForKey:@"sta_list"];
    NSLog(@"%@",array);
    NSDictionary *item = (NSDictionary *)[array objectAtIndex:indexPath.row];
    NSString* str = [item objectForKey:@"name"];
    //NSLog(@"%@",str);
    //NSString *str = @"lllhr";
    
    //cell.textLabel.text = [item objectForKey:@"mainTitleKey"];
    cell.textLabel.text = str;
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

}

-(void)viewWillDisappear:(BOOL)animated{

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

//
//  FirstViewController.m
//  goatsports
//
//  Created by 刘浩然 on 9/23/17.
//  Copyright © 2017 刘浩然. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
#pragma mark - 创建请求者

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)postmessage:(id)paramater{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSString *baseUrl = @"http://47.94.135.66/";
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    [dict initWithObjectsAndKeys:@"1",@"city_id",@"1",@"list_from",@"1",@"list_to", nil];
   // NSString *dict = @'{"city_id": "1", "list_to": "1", "list_from": "1"}';
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.responseSerializer =  [AFJSONResponseSerializer serializer];
    [session.requestSerializer setValue:@"20301" forHTTPHeaderField:@""];
    [session POST:baseUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];
    
    
    
//    [session GET:@"http://47.94.135.66" parameters:paramater success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"成功");
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"失败");
//    }];
}

-(IBAction)sendMessage:(id)sender{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSString *baseUrl = @"http://47.94.135.66:80/API";
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:dataPath];
    NSError *error;
     NSString *para = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
     session.requestSerializer.timeoutInterval = requestTime;
    //NSString *dict = @"{'city_id': '1','list_from': '1', 'list_to': '1'}";
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.responseSerializer =  [AFJSONResponseSerializer serializer];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/json"];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    //    [session.requestSerializer setValue:@"application/vnd.kw.1.0.0+json" forHTTPHeaderField:@"Accept"];
//    [session.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [session.requestSerializer setValue:@"20301" forHTTPHeaderField:@"protal"];
//   [session HEAD:@"protal:20301" parameters:para success:^(NSURLSessionDataTask * _Nonnull task) {
//       NSLog(@"responseObject = %@",task);
//   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//       NSLog(@"error = %@",error);
//   }];
    [session POST:baseUrl parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];
    
//    [session POST:baseUrl parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSLog(@"responseObject = %@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error = %@",error);
//    }];
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
//    NSString *jsonStr  = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    NSData *jaonData   = [[NSData alloc] initWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
//    NSArray *allTrack = [NSJSONSerialization JSONObjectWithData:jaonData options:(NSJSONReadingMutableContainers) error:nil];
//    NSLog(@"%@",jaonData);
//     NSLog(@"%@",jaonData);
    //[self postmessage:jsonStr];
   
    
}

@end

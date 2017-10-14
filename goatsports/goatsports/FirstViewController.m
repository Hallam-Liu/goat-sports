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

-(id)postmessage:(NSDictionary*)dict protal:(NSString*)protal {
    AFHTTPSessionManager *sendsession = [AFHTTPSessionManager manager];
    NSString *baseUrl = @"http://47.94.135.66:80/API";
    //-----------------------Liuhr
    BOOL isYes = [NSJSONSerialization isValidJSONObject:dict];
    
    if (isYes) {
        NSLog(@"可以转换");
        
        /* JSON data for obj, or nil if an internal error occurs. The resulting data is a encoded in UTF-8.
         */
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
        
        /*
         Writes the bytes in the receiver to the file specified by a given path.
         YES if the operation succeeds, otherwise NO
         */
        // 将JSON数据写成文件
        // 文件添加后缀名: 告诉别人当前文件的类型.
        // 注意: AFN是通过文件类型来确定数据类型的!如果不添加类型,有可能识别不了! 自己最好添加文件类型.
        [jsonData writeToFile:@"/Users/SunnyBoy/Sites/JSON_XML/dict.json" atomically:YES];
        
        NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        
    } else {
        
        NSLog(@"JSON数据生成失败，请检查数据格式");
        
    }
    //-----------------------LIuhr
    NSError *error;
//    NSString *para = [NSJSONSerialization jsonStringWithString:string];
    sendsession.requestSerializer.timeoutInterval = requestTime;
    sendsession.requestSerializer = [AFJSONRequestSerializer serializer];
    sendsession.responseSerializer =  [AFJSONResponseSerializer serializer];
    sendsession.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    sendsession.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/json"];
    sendsession.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    sendsession.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    NSString *para = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];

    [sendsession.requestSerializer setValue:protal forHTTPHeaderField:@"portal"];
    
    [sendsession POST:baseUrl parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];


    return self;
}

-(IBAction)sendMessage:(id)sender{
    NSDictionary *signup = @{@"stadium_id":@"1"};
    [self postmessage:signup protal:@"20202"];
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    NSString *baseUrl = @"http://47.94.135.66:80/API";
//    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
//    NSData *data = [[NSFileManager defaultManager] contentsAtPath:dataPath];
//   //--------------------------------------------------------------
//    NSDictionary *dict = @{@"city_id": @"sdf"};
//    
//    // 1.判断当前对象是否能够转换成JSON数据.
//    // YES if obj can be converted to JSON data, otherwise NO
//    BOOL isYes = [NSJSONSerialization isValidJSONObject:dict];
//    
//    if (isYes) {
//        NSLog(@"可以转换");
//        
//        /* JSON data for obj, or nil if an internal error occurs. The resulting data is a encoded in UTF-8.
//         */
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
//        
//        /*
//         Writes the bytes in the receiver to the file specified by a given path.
//         YES if the operation succeeds, otherwise NO
//         */
//        // 将JSON数据写成文件
//        // 文件添加后缀名: 告诉别人当前文件的类型.
//        // 注意: AFN是通过文件类型来确定数据类型的!如果不添加类型,有可能识别不了! 自己最好添加文件类型.
//        [jsonData writeToFile:@"/Users/SunnyBoy/Sites/JSON_XML/dict.json" atomically:YES];
//        
//        NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
//        
//    } else {
//        
//        NSLog(@"JSON数据生成失败，请检查数据格式");
//        
//    }
//   //--------------------------------------------------------------
//    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
//     NSString *para = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
//    
//     NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
//    //para = @'{"city_id": "sdf"}';
//     session.requestSerializer.timeoutInterval = requestTime;
//    //NSString *dict = @"{'city_id': '1','list_from': '1', 'list_to': '1'}";
//    session.requestSerializer = [AFJSONRequestSerializer serializer];
//    session.responseSerializer =  [AFJSONResponseSerializer serializer];
//    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/json"];
//    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
//    [session.requestSerializer setValue:@"20201" forHTTPHeaderField:@"protal"];
//
//    [session POST:baseUrl parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"responseObject = %@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error = %@",error);
//    }];

   
    
}

@end

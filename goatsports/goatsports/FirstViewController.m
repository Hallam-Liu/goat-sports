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



-(NSDictionary*)postmessage:(NSDictionary*)dict protal:(NSString*)protal success:(HttpSuccess)success failure:(HttpFailure)failure {
    AFHTTPSessionManager *sendsession = [AFHTTPSessionManager manager];
    NSString *baseUrl = @"http://47.94.135.66:80/API";
    //-----------------------Liuhr 查看发送的内容字典是否可转换为Json
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
    //-----------------------LIuhr查看发送的内容字典是否可转换为Json
    NSError *error;
//    NSString *para = [NSJSONSerialization jsonStringWithString:string];
    sendsession.requestSerializer.timeoutInterval = requestTime;
    sendsession.requestSerializer = [AFJSONRequestSerializer serializer];
    sendsession.responseSerializer =  [AFJSONResponseSerializer serializer];
    //sendsession.responseSerializer = [AFHTTPResponseSerializer serializer];
    sendsession.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    sendsession.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/json"];
    sendsession.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    sendsession.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    NSString *para = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];

    [sendsession.requestSerializer setValue:protal forHTTPHeaderField:@"portal"];
    [sendsession POST:baseUrl parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Response = responseObject;
        //[Response initWithDictionary:respond];
        NSLog(@"responseObject = %@",responseObject);
        for (NSString *s in [Response allValues]) {
            NSLog(@"222value: %@", s);
            
        }
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];
    return 0;
}



-(IBAction)sendMessage:(id)sender{
    NSDictionary *signup = @{@"city_id":@"0"};
    [self postmessage:signup protal:@"20201" success:^(NSDictionary *dic) {
        for (NSString *s in [dic allValues]) {
            NSLog(@"lhrlhrvalue: %@", s);
            
        }
    }
     
              failure:^(NSError *error) {
                  NSLog(@"return wrong%@",error);

    }];
   //[NSThread sleepForTimeInterval:3.0f];  //延迟三秒；

}
-(IBAction)test:(id)sender{
    for (NSString *s in [Response allValues]) {
        NSLog(@"cnmcnmcnmvalue: %@", s);
        
    }

}


@end

//
//  ViewController.m
//  KKKiller
//
//  Created by 我是MT on 17/1/8.
//  Copyright © 2017年 馒头科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

#ifdef KKRELEASE //正式发布版
    [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"IS_DEBUG"];
#else //开发版
#ifdef DEBUG  //开发版测试环境
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"IS_DEBUG"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"IS_DEBUG"];
    }
#else //开发版正式环境
    [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"IS_DEBUG"];
#endif
#endif
    
    //读取开关信息
    BOOL isTestingEnvironment = [[NSUserDefaults standardUserDefaults] objectForKey:@"IS_DEBUG"] ? [[[NSUserDefaults standardUserDefaults] objectForKey:@"IS_DEBUG"] boolValue] : NO;
    NSLog(@"%@",@(isTestingEnvironment));
    
    NSString *baseUrl = nil;
    if (isTestingEnvironment) {
        self.view.backgroundColor = [UIColor greenColor];
        baseUrl = @"http://www.sb.com";
    }else{
        self.view.backgroundColor = [UIColor purpleColor];
        baseUrl = @"http://www.2b.com";
    }
    
}


@end

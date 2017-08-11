//
//  ViewController.m
//  GCDDemo
//
//  Created by 123456 on 2017/8/11.
//  Copyright © 2017年 hekai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    // 同步执行任务创建方法
    dispatch_sync(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);    // 这里放任务代码
    });
    // 异步执行任务创建方法
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);    // 这里放任务代码
    });
}
- (void) syncConcurrent
{
    NSLog(@"syncConcurrent---begin");
    
    dispatch_queue_t queue= dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"syncConcurrent---end");
}
- (void) asyncConcurrent
{
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue= dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncConcurrent---end");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

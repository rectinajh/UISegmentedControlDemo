//
//  ViewController.m
//  lesson3_6.3
//
//  Created by rimi on 15/6/3.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@property (nonatomic,strong)UIActivityIndicatorView         *indicatorView;
- (void)initializeUserface;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeUserface];
}

- (void)initializeUserface {
    
#pragma mark - UILabel 文本自适应
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 300, 200, 0)];
    // 设置文本
    label.text = @"你好，UI！你好，UI！你好，UI！你好，UI！你好，UI！你好，UI！你好，UI！你好，UI！";
    // 设置无限行数
    label.numberOfLines = 0;
    // 系统自动适应当前文本，并且设置相应大小
    [label sizeToFit];
    // 添加到父视图
    [self.view addSubview:label];
    
#pragma mark - UISegmentedControl 分段控件
    UISegmentedControl *segControl = [[UISegmentedControl alloc]initWithItems:@[@"红色",@"蓝色"]];
    //设置中心点
    segControl.center = CGPointMake(187, 40);
    // 添加到父视图
    [self.view addSubview:segControl];
    // 设置主色调
    segControl.tintColor = [UIColor purpleColor];
    // 添加事件：
    [segControl addTarget:self action:@selector(stream:handleEvent:) forControlEvents:UIControlEventValueChanged];
    
#pragma mark - UISwith 开关
    UISwitch *switchControl = [[UISwitch alloc]init];
    //设置中心点
    switchControl.center = CGPointMake(100, 400);
    //添加到视图
    [self.view addSubview:switchControl];
    // 设置主色调
    switchControl.tintColor = [UIColor lightGrayColor];
    //开启色调
    switchControl.onTintColor = [UIColor brownColor];
    //设置按钮色调
    switchControl.thumbTintColor = [UIColor purpleColor];
    //添加事件
    [switchControl addTarget:self action:@selector(handleEvent:) forControlEvents:UIControlEventValueChanged];
    
#pragma mark - UISlider 滑条
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 200, 375, 20)];
    //
    //slider.center = CGPointMake(100, 190);
    [self.view addSubview:slider];
    
    //添加按钮颜色
    slider.thumbTintColor = [UIColor redColor];
    
    //设置色调
    slider.maximumTrackTintColor = [UIColor whiteColor];
    slider.minimumTrackTintColor = [UIColor blueColor];
    
    //添加事件
    [slider addTarget:self action:@selector(handleEvent:) forControlEvents:UIControlEventValueChanged];
    
#pragma mark - UIProgress 进度条
    UIProgressView *progeressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 200, 375, 20)];
    [self.view addSubview:progeressView];
    
    // 设置颜色
    progeressView.trackTintColor = [UIColor redColor];
    progeressView.progressTintColor = [UIColor blueColor];
    
    // 设置标签值
    progeressView.tag = 100;
    
#pragma mark - UIActivityIndicatorView 活动指示器
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [indicatorView setBounds:CGRectMake(9, 9, 30, 30)];
    
    [indicatorView setCenter:CGPointMake(180, 400)];
    
    [self.view addSubview:indicatorView];
    
    //设置停止时候是否隐藏（默认yes）
    indicatorView.hidesWhenStopped = NO;
    //开启动画
    [indicatorView startAnimating];
    //进行关联
    self.indicatorView = indicatorView;
    // 延迟调用方法(dis-after)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"hihi");
        [self.indicatorView  stopAnimating];
#pragma mark - UIAlertView警告框
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"八嘎" message:@"要停了" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        //展示
        [alertView show];
        //
    });
    //
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"取消");
    } else {
        NSLog(@"确定");
    }

}

- (void)handleEvent:(id)sender {
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        // 强转
        UISegmentedControl *seg = (UISegmentedControl *)sender;
        
        if (seg.selectedSegmentIndex == 0) {
            
            self.view.backgroundColor = [UIColor blueColor];
        } else
        {
            self.view.backgroundColor = [UIColor grayColor];
        }
        
    }else if ([sender isKindOfClass:[UISwitch class]]) {
        
        UISwitch *switchControl = (UISwitch *)sender;//弱引用
        if (switchControl.isOn) {
            
            self.view.backgroundColor = [UIColor blueColor];
        } else {
            
            self.view.backgroundColor = [UIColor grayColor];
        }
        } else if([sender isKindOfClass:[UISlider class]]){
            
        UISlider *slider = (UISlider *)sender;
        self.view.alpha = 1 - slider.value;
        
        //通过标签获取视图
        UIProgressView *progressView = (UIProgressView *)[self.view viewWithTag:100];
        progressView.progress = slider.value;
        
    }
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end

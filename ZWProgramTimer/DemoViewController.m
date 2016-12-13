//
//  DemoViewController.m
//  ZWProgramTimer
//
//  Created by 流年划过颜夕 on 2016/12/13.
//  Copyright © 2016年 liunianhuaguoyanxi. All rights reserved.
//

#import "DemoViewController.h"
#import "ZWProgramTimerView.h"
@interface DemoViewController ()<ZWProgramTimerViewDelegate>
@property (nonatomic ,weak)ZWProgramTimerView *programTimerView;
@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"1");
    self.view.backgroundColor=[UIColor whiteColor];
    ZWProgramTimerView *view=[[ZWProgramTimerView alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 15)];
    
    view.layer.borderColor=[UIColor orangeColor].CGColor;
    
    view.layer.borderWidth=2;
    //计时条背景色   timing bar background color
    view.backgroundColor=[UIColor lightGrayColor];
    
    //计时条颜色     timing bar  color
    view.timeCountColor=[UIColor yellowColor];
    
    //计时栏颜色     timing lab  color
    view.timeCountLabColor=[UIColor blackColor];
    
    //设置计时栏渐变色  set gradient about TimeCountLab‘Color
    view.isTimeCountLabColorGradient=YES;
    
    //origin Time Frequency      初始时间次数
    view.originTimeFrequency=50;
    
    //total Time Frequency       计时总次数
    view.totalTimeFrequency=50;
    
    //time Interval (Unit：Seconds)    计时间隔 （单位：秒）
    view.timeInterval=0.05;
    
    view.delegate=self;
    
    [self.view addSubview:view];
    self.programTimerView=view;
    

    
    
    
    
    
    [self settingBtntoControl];
}





-(void)settingBtntoControl
{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(30, 300, 80, 20)];
    btn.backgroundColor=[UIColor blackColor];
    [btn setTitle:@"start" forState:0];
    [btn addTarget:self action:@selector(runStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(220, 350, 80, 20)];
    btn1.backgroundColor=[UIColor blackColor];
    [btn1 setTitle:@"end" forState:0];
    [btn1 addTarget:self action:@selector(runEnd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(30, 350, 80, 20)];
    btn2.backgroundColor=[UIColor blackColor];
    [btn2 setTitle:@"Resume" forState:0];
    [btn2 addTarget:self action:@selector(runContinue) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(220, 300, 80, 20)];
    btn3.backgroundColor=[UIColor blackColor];
    [btn3 setTitle:@"Pause" forState:0];
    [btn3 addTarget:self action:@selector(runPause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

//start    开始计时
-(void)runStart
{
        [self.programTimerView ZWProgramTimerStart];
}
//end      结束计时
-(void)runEnd
{
    [self.programTimerView ZWProgramTimerEnd];
    
}

//continue 继续计时
-(void)runContinue
{
    [self.programTimerView ZWProgramTimerContinue];
}

//pause    暂停计时
-(void)runPause
{
        [self.programTimerView ZWProgramTimerPause];
}

//time up feedback  计时结束回调
-(void)ZWProgramTimerTimeUp:(ZWProgramTimerView *)ZWProgramTimerView
{
    NSLog(@"Time Up");
}

@end

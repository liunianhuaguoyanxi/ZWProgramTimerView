# ZWProgramTimerView
###Quickly Build A Timer View
###非常简单实用的计时器视图，功能也很明显，快速生成时间计时条，动态控制计时器开始，结束，暂停，继续。结构简单延展性高，可以快速集成于你需要的地方，希望能带给你帮助，觉得还行记得Start哟~
#Show What it is   
#基本展示
##quickly build the timer view 
##快速创建计时条
![image](https://github.com/liunianhuaguoyanxi/ZWProgramTimerView/blob/master/Gif/ZWProgramTimer.gif)
##quickly the timer view can start ,pause,continue,end 
##一键控制计时条开始，暂停，继续和结束
![image](https://github.com/liunianhuaguoyanxi/ZWProgramTimerView/blob/master/Gif/ZWProgramTimer1.gif)
#How to use
## Init 初始化（important）
    ZWProgramTimerView *programTimerView=[[ZWProgramTimerView alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 15)];

###origin Time Frequency      初始时间次数
    programTimerView.originTimeFrequency=50;
    
###total Time Frequency       计时总次数
    programTimerView.totalTimeFrequency=50;
    
###time Interval (Unit：Seconds)    计时间隔 （单位：秒）
    programTimerView.timeInterval=0.05;

###set delegate 设置代理
    programTimerView.delegate=self;
    
    [self.view addSubview:programTimerView];

## Preferences 偏好设置

    programTimerView.layer.borderColor=[UIColor orangeColor].CGColor;
    
    programTimerView.layer.borderWidth=2;
###计时条背景色   timing bar background color
    programTimerView.backgroundColor=[UIColor lightGrayColor];
    
###计时条颜色     timing bar  color
    programTimerView.timeCountColor=[UIColor yellowColor];
    
###计时栏颜色     timing lab  color
    programTimerView.timeCountLabColor=[UIColor blackColor];
    
###设置计时栏渐变色  set gradient about TimeCountLab‘Color
    programTimerView.isTimeCountLabColorGradient=YES;




##Timing Begins 开始计时
 [programTimerView ZWProgramTimerStart];

##Timing Ends   停止计时
 [programTimerView ZWProgramTimerEnd];

##Timing Pause  暂停计时
 [programTimerView ZWProgramTimerPause];

##Timing Coutinue 继续计时
 [programTimerView ZWProgramTimerContinue];


##Time Up's Feedback  时间结束回调
-(void)ZWProgramTimerTimeUp:(ZWProgramTimerView *)ZWProgramTimerView

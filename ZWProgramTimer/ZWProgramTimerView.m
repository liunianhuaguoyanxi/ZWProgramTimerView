//
//  ZWProgramTimerView.m
//  ZWProgramTimer
//
//  Created by 流年划过颜夕 on 2016/12/13.
//  Copyright © 2016年 liunianhuaguoyanxi. All rights reserved.
//

#import "ZWProgramTimerView.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ZWProgramTimerView()
@property (nonatomic, assign) CGFloat                   toStartCountDown;
@property (nonatomic, weak  ) UIView                   *showunderView;
@property (nonatomic, assign) BOOL                       isResume;
@property (nonatomic, weak  ) NSTimer                     *countTimer;
@end;
@implementation ZWProgramTimerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        
        UIView *showunderView=[[UIView alloc]init];
        [self addSubview:showunderView];
        self.showunderView=showunderView;
        
        UILabel *timeCountLab=[[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width-100)/2, 0, 100, self.frame.size.height)] ;
        timeCountLab.font=[UIFont systemFontOfSize:10];
        timeCountLab.textAlignment=NSTextAlignmentCenter;
        timeCountLab.textColor=self.timeCountLabColor?self.timeCountLabColor:[UIColor blackColor];
        [self addSubview:timeCountLab];
        self.timeCountLab=timeCountLab;

    }
    return self;
}
-(void)layoutSubviews
{

}
-(void)countTime:(NSTimer *)sender
{
    

        self.toStartCountDown--;
    NSLog(@"%f",self.toStartCountDown);

        float settime= self.toStartCountDown/self.totalTimeFrequency;
            self.timeCountLab.text=[NSString stringWithFormat:@"%.0f %%",100*(1-settime)];

    
    self.showunderView.frame=CGRectMake(0, 0, self.frame.size.width*(1-settime), self.frame.size.height);
    
    if (self.isTimeCountLabColorGradient) {
        self.timeCountLab. alpha=(1-settime);
    }

    
    if (self.isTimeCountColorGradient) {
        self.showunderView.alpha=(1-settime);
    }

    

    
    

    
    

    if (self.toStartCountDown<=0) {
        
        

        [self.countTimer invalidate];
        self.countTimer=nil;
        
        if ([self.delegate respondsToSelector:@selector(ZWProgramTimerTimeUp:)]) {
            [self.delegate ZWProgramTimerTimeUp:self];
        }
        
    }
    
}

-(void)ZWProgramTimerStart
{
    //    //显时器
    if (![self.countTimer isValid]) {
        self.showunderView.frame=CGRectMake(0, 0, 0, self.frame.size.height);
        self.showunderView.backgroundColor=_timeCountColor?_timeCountColor:[UIColor yellowColor];
        self.toStartCountDown=self.originTimeFrequency;
        self.countTimer = [ NSTimer scheduledTimerWithTimeInterval:self.timeInterval?self.timeInterval:1.0
                                                            target:self
                                                          selector:@selector(countTime:)
                                                          userInfo:nil
                                                           repeats:YES];
        
        [self.countTimer fire];
    }else
    {
    [self.countTimer invalidate];
    self.countTimer=nil;
        self.showunderView.frame=CGRectMake(0, 0, 0, self.frame.size.height);
        self.toStartCountDown=self.originTimeFrequency;
        self.countTimer = [ NSTimer scheduledTimerWithTimeInterval:self.timeInterval?self.timeInterval:1.0
                                                            target:self
                                                          selector:@selector(countTime:)
                                                          userInfo:nil
                                                           repeats:YES];
        

        [self.countTimer fire];
    }
    self.timeCountLab.textColor=self.timeCountLabColor?self.timeCountLabColor:[UIColor blackColor];
    self.showunderView.backgroundColor=_timeCountColor?_timeCountColor:[UIColor orangeColor];
    self.isResume=NO;
}
-(void)ZWProgramTimerEnd
{
    if (![self.countTimer isValid]) {
        self.showunderView.frame=CGRectMake(0, 0, 0, self.frame.size.height);
        self.toStartCountDown=self.originTimeFrequency;
        if (self.originTimeFrequency>self.totalTimeFrequency) {
            self.totalTimeFrequency=self.originTimeFrequency;
        }

    }else
    {
    [self.countTimer invalidate];
    self.countTimer=nil;
    self.showunderView.frame=CGRectMake(0, 0, 0, self.frame.size.height);
    self.toStartCountDown=self.originTimeFrequency;
    }
    self.timeCountLab.text=@"0%";
        self.isResume=NO;
}
-(void)ZWProgramTimerPause
{

    if (self.isResume==NO) {
        if (![self.countTimer isValid]) {
            return ;
        }
        
        [self.countTimer setFireDate:[NSDate distantFuture]];
        self.isResume=YES;
    }else
    {
        
    }

        
        
   
}
-(void)ZWProgramTimerContinue{
   
    if (self.isResume==YES) {
        if (![self.countTimer isValid]) {
            return ;
        }
        
        
        [self.countTimer setFireDate:[NSDate distantPast]];
        self.isResume=NO;
    }else
    {
        
    }

    
}

@end

//
//  ZWProgramTimerView.h
//  ZWProgramTimer
//
//  Created by 流年划过颜夕 on 2016/12/13.
//  Copyright © 2016年 liunianhuaguoyanxi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZWProgramTimerView;
@protocol  ZWProgramTimerViewDelegate <NSObject>
//Time Up's Feedback  时间结束回调
-(void)ZWProgramTimerTimeUp:(ZWProgramTimerView *)ZWProgramTimerView;



@end

@interface ZWProgramTimerView : UIView

//time Count Color           进度条颜色
@property (nonatomic, strong) UIColor                     *timeCountColor;

//time Count Lab Color       计时栏颜色
@property (nonatomic, strong) UIColor                     *timeCountLabColor;

//time Count Lab             计时栏
@property (nonatomic, weak  ) UILabel                     *timeCountLab;


//origin Time Frequency      初始时间次数
@property (nonatomic, assign) CGFloat                     originTimeFrequency;

//total Time Frequency       计时总次数
@property (nonatomic, assign) CGFloat                     totalTimeFrequency;

//time Interval (Unit：Seconds)    计时间隔 （单位：秒）
@property (nonatomic, assign) CGFloat                     timeInterval;

//set gradient about TimeCountLab‘color  设置lab渐变色
@property (nonatomic, assign) BOOL                         isTimeCountLabColorGradient;

//set gradient about TimeCount‘color  设置进度条渐变色
@property (nonatomic, assign) BOOL                         isTimeCountColorGradient;

@property (nonatomic, weak  )id<ZWProgramTimerViewDelegate> delegate;

//Timing Begins 开始计时
-(void)ZWProgramTimerStart;

//Timing Ends   停止计时
-(void)ZWProgramTimerEnd;

//Timing Pause  暂停计时
-(void)ZWProgramTimerPause;

//Timing Coutinue 继续计时
-(void)ZWProgramTimerContinue;
@end

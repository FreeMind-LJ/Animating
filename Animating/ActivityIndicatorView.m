//
//  ActivityIndicatorView.m
//  Animating
//
//  Created by lujb on 15/5/18.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "ActivityIndicatorView.h"

#define ANIMATION_TIME 0.5

@interface ActivityIndicatorView ()

@property(nonatomic,assign)BOOL isAnimating;

@property (nonatomic, assign) CGRect firstPoint, secondPoint, thirdPoint, fourthPoint;
@property (nonatomic, strong) CALayer *firstIndicator, *secondIndicator, *thirdIndicator;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int stepNumber;

@end

@implementation ActivityIndicatorView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupViews:self.frame];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupViews:frame];
    }
    return self;
}

-(void)setupViews:(CGRect)frame
{
    _indicatorRadius = frame.size.height <= frame.size.width ? frame.size.width/12 : frame.size.height/12;
    
    _isAnimating = NO;
    _color = [UIColor colorWithRed:190/255.0f green:120/255.0f blue:30/255.0f alpha:1.0];
    
    _firstPoint = CGRectMake(frame.size.width/4-_indicatorRadius, frame.size.height/2-_indicatorRadius, 2*_indicatorRadius, 2*_indicatorRadius);
    _secondPoint = CGRectMake(frame.size.width/2-_indicatorRadius, frame.size.height/4-_indicatorRadius, 2*_indicatorRadius, 2*_indicatorRadius);
    _thirdPoint = CGRectMake(3*frame.size.width/4-_indicatorRadius, frame.size.height/2-_indicatorRadius, 2*_indicatorRadius, 2*_indicatorRadius);
    _fourthPoint = CGRectMake(frame.size.width/2-_indicatorRadius, 3*frame.size.height/4-_indicatorRadius, 2*_indicatorRadius, 2*_indicatorRadius);
    
    //第一个点上下移动
    _firstIndicator = [CALayer layer];
    [_firstIndicator setMasksToBounds:YES];
    [_firstIndicator setBackgroundColor:[self.color CGColor]];
    [_firstIndicator setCornerRadius:_indicatorRadius];
    [_firstIndicator setBounds:CGRectMake(0.0f, 0.0f, _indicatorRadius*2, _indicatorRadius*2)];
    _firstIndicator.frame = _fourthPoint;
    
    //第二个点左右移动
    _secondIndicator = [CALayer layer];
    [_secondIndicator setMasksToBounds:YES];
    [_secondIndicator setBackgroundColor:[self.color CGColor]];
    [_secondIndicator setCornerRadius:_indicatorRadius];
    [_secondIndicator setBounds:CGRectMake(0.0f, 0.0f, _indicatorRadius*2, _indicatorRadius*2)];
    _secondIndicator.frame = _firstPoint;
    
    //第三个点顺时针移动
    _thirdIndicator = [CALayer layer];
    [_thirdIndicator setMasksToBounds:YES];
    [_thirdIndicator setBackgroundColor:[self.color CGColor]];
    [_thirdIndicator setCornerRadius:_indicatorRadius];
    [_thirdIndicator setBounds:CGRectMake(0.0f, 0.0f, _indicatorRadius*2, _indicatorRadius*2)];
    _thirdIndicator.frame = _thirdPoint;
    
    [[self layer] addSublayer:_firstIndicator];
    [[self layer] addSublayer:_secondIndicator];
    [[self layer] addSublayer:_thirdIndicator];
    
    self.layer.hidden = YES;

}

-(void)startAnimating
{
    if (!_isAnimating)
    {
        _isAnimating = YES;
        self.layer.hidden = NO;
        _timer = [NSTimer scheduledTimerWithTimeInterval:ANIMATION_TIME target:self selector:@selector(animateNextStep) userInfo:nil repeats:YES];
    }
}

-(void)hide
{
    self.layer.hidden = YES;
}

-(void)stopAnimating
{
    _isAnimating = NO;
  
    [_timer invalidate];
    _stepNumber = 0;
    _firstIndicator.frame = _fourthPoint;
    _secondIndicator.frame = _firstPoint;
    _thirdIndicator.frame = _thirdPoint;
}

-(void)animateNextStep
{
    switch (_stepNumber)
    {
        case 0:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_TIME];
            _firstIndicator.frame = _secondPoint;
            _thirdIndicator.frame = _fourthPoint;
            [CATransaction commit];
            break;
        case 1:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_TIME];
            _secondIndicator.frame = _thirdPoint;
            _thirdIndicator.frame = _firstPoint;
            [CATransaction commit];
            break;
        case 2:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_TIME];
            _firstIndicator.frame = _fourthPoint;
            _thirdIndicator.frame = _secondPoint;
            [CATransaction commit];
            break;
        case 3:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_TIME];
            _secondIndicator.frame = _firstPoint;
            _thirdIndicator.frame = _thirdPoint;
            [CATransaction commit];
            break;
        case 4:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_TIME];
            _firstIndicator.frame = _secondPoint;
            _thirdIndicator.frame = _fourthPoint;
            [CATransaction commit];
            _stepNumber = 0;
        default:
            break;
    }
    _stepNumber++;
}

- (BOOL)isAnimating
{
    return _isAnimating;
}

@end

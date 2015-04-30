//
//  MenuView.m
//  Animating
//
//  Created by lujb on 15/4/29.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "MenuView.h"

@interface MenuView ()

@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIView *middleView;
@property(nonatomic,strong)UIView *bottomView;

@property(nonatomic,assign)BOOL bThreeLines;
@end

@implementation MenuView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(2, 10, frame.size.width-2, 2)];
        _topView.backgroundColor = [UIColor blueColor];
        [self addSubview:_topView];
        
        _middleView = [[UIView alloc] initWithFrame:CGRectMake(2, 20, frame.size.width-2, 2)];
        _middleView.backgroundColor = [UIColor blueColor];
        [self addSubview:_middleView];
        
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(2, 30, frame.size.width-2, 2)];
        _bottomView.backgroundColor = [UIColor blueColor];
        [self addSubview:_bottomView];
        
        _bThreeLines = YES;
    }
    
    return self;
}

-(void)animate
{
    if(_bThreeLines){
        [self  threeLinesToTwoAnimate];
        _bThreeLines = FALSE;
        return;
    }else{
        [self  TwoLinesToThreeAnimate];
        _bThreeLines = TRUE;
        return;
    }

}

-(void)threeLinesToTwoAnimate
{
    _middleView.hidden = YES;
    [UIView animateWithDuration:0.1 animations:^{
        //上 下面的线先下移到中间在进行旋转
        _topView.frame = CGRectMake(_topView.frame.origin.x, _topView.frame.origin.y+10, _topView.frame.size.width, _topView.frame.size.height);
        _bottomView.frame = CGRectMake(_bottomView.frame.origin.x, _bottomView.frame.origin.y-10, _bottomView.frame.size.width, _bottomView.frame.size.height);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
            [_topView setTransform:CGAffineTransformMakeRotation(3.1415/4)] ;;
        } completion:nil];
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
            [_bottomView setTransform:CGAffineTransformMakeRotation(-3.1415/4)] ;;
        } completion:^(BOOL finished) {
        }];
        
    }];
    

}

-(void)TwoLinesToThreeAnimate
{
    //恢复
    _topView.transform = CGAffineTransformIdentity;
    _bottomView.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.3
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveLinear animations:^{
                            _topView.frame = CGRectMake(_topView.frame.origin.x, _topView.frame.origin.y-10, _topView.frame.size.width, _topView.frame.size.height);
                            _bottomView.frame = CGRectMake(_bottomView.frame.origin.x, _bottomView.frame.origin.y+10, _bottomView.frame.size.width, _bottomView.frame.size.height);

        } completion:^(BOOL finished) {
            _topView.transform = CGAffineTransformIdentity;
            _bottomView.transform = CGAffineTransformIdentity;
        }];
    
    _middleView.hidden = NO;
}

@end

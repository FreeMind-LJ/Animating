//
//  DragViewController.m
//  Animating
//
//  Created by lujb on 15/4/23.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "DragViewController.h"

@interface DragViewController ()

@property (weak, nonatomic) IBOutlet UIButton *circleView;
@end

@implementation DragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设为圆形
    self.circleView.layer.cornerRadius = CGRectGetWidth(self.circleView.bounds)/2;

    //添加拖动手势
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];
    self.circleView.userInteractionEnabled = YES;
    [self.circleView addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.circleView addGestureRecognizer:recognizer];
}

- (void)touchDown:(UIControl *)sender {
    //[sender.layer pop_removeAllAnimations];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.view];//获取加速度
        
        CGPoint destination = self.view.center;//[self caculteDecayPositonByOrigionPositon:self.circleView.center velocity:velocity];
        
        [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.circleView.center = destination;
        } completion:^(BOOL finished) {
            ;
        }];
    }
}

//加速度计算   Vt =  V0 - at ,a为重力加速度
/**
 *  计算衰减后的位置
 *
 *  @param originalPos 原始位置
 *  @param velocity    xy方向加速度大小
 *
 *  @return 停止后的位置
 */
-(CGPoint)caculteDecayPositonByOrigionPositon:(CGPoint)originalPos velocity:(CGPoint)velocity
{
    return CGPointZero;
}

@end

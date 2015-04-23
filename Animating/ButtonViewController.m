//
//  ButtonViewController.m
//  Animating
//
//  Created by lujb on 15/4/23.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@property (nonatomic,weak) IBOutlet UIButton *Login;
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addActivityIndicatorView];
    self.Login.layer.cornerRadius = 4.f;
    [self.Login setTitleColor:[UIColor whiteColor]
               forState:UIControlStateNormal];
    self.Login.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium"
                                           size:22];
    [self.Login addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self hideLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addActivityIndicatorView
{
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicatorView];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)touchUpInside:(UIButton *)button
{
    [self buttonScaleAnimation];
    [self.activityIndicatorView startAnimating];
    button.userInteractionEnabled = NO;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.activityIndicatorView stopAnimating];
        button.userInteractionEnabled= YES;
        [self buttonTranslationAnimation];
        
        
    });
}

//按钮缩放
-(void)buttonScaleAnimation
{
    [self hideLabel];
    self.Login.transform = CGAffineTransformMakeScale(0.5, 0.5); //先缩小
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.Login.transform = CGAffineTransformIdentity;//恢复原状
    } completion:nil];
}

//按钮左右移动
-(void)buttonTranslationAnimation
{
    self.Login.transform = CGAffineTransformMakeTranslation(20, 0); //x轴左右移动
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.Login.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self showLabel];
    }];
    
}

-(void)showLabel
{
    self.loginLabel.hidden = NO;
    self.loginLabel.transform = CGAffineTransformMakeTranslation(40, 0); //x轴左右移动
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.loginLabel.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)hideLabel
{
    self.loginLabel.hidden = YES;
}
@end

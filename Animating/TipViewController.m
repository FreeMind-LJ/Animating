//
//  TipViewController.m
//  Animating
//
//  Created by lujb on 15/4/29.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UIView *tipView;
@end

@implementation TipViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    _tipView.layer.cornerRadius = 4.0f;
}

- (IBAction)dismiss:(id)sender
{
    self.view.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:3.0 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 700);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
   
}


@end

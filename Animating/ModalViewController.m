//
//  ModalViewController.m
//  Animating
//
//  Created by lujb on 15/4/28.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "ModalViewController.h"
#import "TipViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (IBAction)presentModalController:(id)sender
{
    UIStoryboard *storyboard = self.storyboard;
    TipViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"TipViewController"];
    [self.view addSubview:svc.view];
    [self addChildViewController:svc]; //需要add controller,不然无法接收点击事件
    
    svc.view.transform = CGAffineTransformMakeTranslation(0, -640);
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:20 options:UIViewAnimationOptionCurveLinear animations:^{
        svc.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    
    
}

@end

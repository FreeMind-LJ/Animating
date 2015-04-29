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
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}


@end

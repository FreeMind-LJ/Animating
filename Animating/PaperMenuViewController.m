//
//  PaperMenuViewController.m
//  Animating
//
//  Created by lujb on 15/4/29.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "PaperMenuViewController.h"
#import "MenuView.h"

@interface PaperMenuViewController ()


@property(nonatomic,strong)MenuView *menuView;

@end

@implementation PaperMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _menuView = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, 40 , 40)];
    _menuView.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:_menuView];
    self.navigationItem.rightBarButtonItem = item;
    
    //添加点击事件
    _menuView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [_menuView addGestureRecognizer:tapGesture];
}

-(void)click
{
    [_menuView animate];
}


@end
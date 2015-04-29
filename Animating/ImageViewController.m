//
//  ImageViewController.m
//  Animating
//
//  Created by lujb on 15/4/28.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,assign) BOOL bLarge;

@end

@implementation ImageViewController

-(void)viewDidLoad
{
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick)];
    [_imageView addGestureRecognizer:singleTap1];
}

-(void)imageClick
{
    if (_bLarge) {
        
        _imageView.transform = CGAffineTransformMakeScale(2.0f, 2.0f);//初始状态
        [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
            _imageView.transform = CGAffineTransformIdentity;//恢复原状
        } completion:nil];
        
        _bLarge= NO;
        return;
    }
    _imageView.transform = CGAffineTransformMakeScale(1.0, 1.0); //初始状态
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        _imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    } completion:nil];
    _bLarge = YES;
}

@end

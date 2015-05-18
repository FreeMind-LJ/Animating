//
//  ActivityIndicatorView.h
//  Animating
//
//  Created by lujb on 15/5/18.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ActivityIndicatorView : UIView

@property(nonatomic, strong) UIColor *color;
@property (nonatomic, assign) float indicatorRadius;


-(void)hide;
-(void)startAnimating;
-(void)stopAnimating;
-(BOOL)isAnimating;

@end

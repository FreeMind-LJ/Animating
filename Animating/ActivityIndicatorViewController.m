//
//  ActivityIndicatorViewController.m
//  Animating
//
//  Created by lujb on 15/5/18.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "ActivityIndicatorViewController.h"
#import "ActivityIndicatorView.h"

@interface ActivityIndicatorViewController ()

@property (weak, nonatomic) IBOutlet ActivityIndicatorView *activityIndicator;

@end

@implementation ActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    [_activityIndicator startAnimating];
}

- (IBAction)stop:(id)sender {
    if (_activityIndicator.isAnimating) {
        [_activityIndicator stopAnimating];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

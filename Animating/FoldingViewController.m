//
//  FoldingViewController.m
//  Animating
//
//  Created by lujb on 15/5/6.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import "FoldingViewController.h"

typedef NS_ENUM(NSInteger, Direction) {
    Direction_Top,
    Direction_Bottom
};

@interface FoldingViewController ()

@property(nonatomic,strong)UIImageView *topView;
@property(nonatomic,strong)UIImageView *bottomView;
@property(nonatomic,strong)UIImage *image;

@end

@implementation FoldingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _image =[UIImage imageNamed:@"boat.jpg"];
    [self addTopView];
    [self addBottomView];
    [self addGestureRecognizers];
}


-(void)addTopView
{
    UIImage *topImage = [self imageForDirection:Direction_Top withImage:_image];
    _topView = [[UIImageView alloc] initWithFrame:CGRectMake(100,250,150,100)];
    _topView.image = topImage;
    
    //旋转的时候从底部旋转
    self.topView.layer.anchorPoint = CGPointMake(0.5, 1.0);

    _topView.userInteractionEnabled = YES;
    _topView.contentMode = UIViewContentModeScaleAspectFill;
    _topView.clipsToBounds = YES;
    [self.view addSubview:_topView];
}

- (void)addBottomView
{
    UIImage *bottomImage = [self imageForDirection:Direction_Bottom withImage:_image];
    
    _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(100,300,150,100)];
    _bottomView.image = bottomImage;
    _bottomView.contentMode = UIViewContentModeScaleAspectFill;
    _bottomView.clipsToBounds = YES;
    //bottomView.layer.mask = [self maskForSection:LayerSectionBottom withRect:bottomView.bounds];
    [self.view addSubview:_bottomView];
}


//根据direction截取部分image
-(UIImage*)imageForDirection:(Direction)direction withImage:(UIImage*)image
{
    CGRect rect = CGRectMake(0.f, 0.f, image.size.width, image.size.height / 2.f);
    if (direction == Direction_Bottom) {
        rect.origin.y = image.size.height / 2.f;
    }
    
    CGImageRef imgRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage *imageCrop = [UIImage imageWithCGImage:imgRef];
    CGImageRelease(imgRef);
    
    return imageCrop;

}

- (void)addGestureRecognizers
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(tapClick)];
    
    [self.topView addGestureRecognizer:tapGestureRecognizer];
}

- (void)tapClick
{
    [self rotateToOriginWithVelocity:5];
}

- (void)rotateToOriginWithVelocity:(CGFloat)velocity
{
    _topView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = - 1.0 / 500.0;//m34的默认值是0，通过设置m34为-1.0 / d来应用透视效果
        transform = CATransform3DRotate(transform, M_PI/3, 1, 0, 0);
        _topView.layer.transform = transform;
       
    } completion:^(BOOL finished) {
         [_topView setNeedsLayout];
    }];
}


@end

//
//  BlurViewController.m
//  MyDemo
//
//  Created by chuange.lcg on 16/4/14.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "BlurViewController.h"
#import "UIImage+blurredFrame.h"
#import "UIImage+ImageEffects.h"

@interface BlurViewController ()

@end

@implementation BlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    imageView1.image = [UIImage imageNamed:@"intro_icon_0"];
    [self.view addSubview:imageView1];
    UIVisualEffectView *effectView1 = [[UIVisualEffectView alloc] initWithFrame:imageView1.bounds];
    [imageView1 addSubview:effectView1];
    effectView1.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(150 + 20, 0, 150, 150)];
    imageView2.image = [UIImage imageNamed:@"intro_icon_0"];
    [self.view addSubview:imageView2];
    UIVisualEffectView *effectView2 = [[UIVisualEffectView alloc] initWithFrame:imageView2.bounds];
    [imageView2 addSubview:effectView2];
    effectView2.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:imageView2.bounds];
    lable.text = @"vibrancyView";
    
    UIVisualEffectView *vibrancyView = [[UIVisualEffectView alloc] initWithFrame:imageView2.bounds];
    vibrancyView.effect = [UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effectView2.effect];
    [vibrancyView.contentView addSubview:lable];
    [effectView2.contentView addSubview:vibrancyView];
    
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150 + 20, 150, 150)];
    imageView3.image = [[UIImage imageNamed:@"intro_icon_0"] applyLightEffect];
    [self.view addSubview:imageView3];
    
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(150 + 20, 150 + 20, 150, 150)];
    imageView4.image = [UIImage imageNamed:@"intro_icon_0"];
    [self.view addSubview:imageView4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

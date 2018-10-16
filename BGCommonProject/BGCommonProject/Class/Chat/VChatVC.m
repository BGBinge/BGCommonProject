//
//  VChatVC.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/18.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import "VChatVC.h"

@interface VChatVC ()

@end

@implementation VChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imV = [[UIImageView alloc] initWithFrame:CGRectMake(-100, -100, 300, 200)];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    v.backgroundColor = [UIColor clearColor];
    v.clipsToBounds = YES;
    [v addSubview:imV];
    UIImageView *imV1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400, 300 , 200)];
    
    imV.image = [UIImage imageNamed:@"www"];
    
    [self.view addSubview:v];
    
    imV1.image = [UIImage imageNamed:@"www"];
    
    [self.view addSubview:imV1];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  VUserCenterVC.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/18.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import "VUserCenterVC.h"

@interface VUserCenterVC ()

@end

@implementation VUserCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL URLWithString:@"https://www.apiopen.top/weatherApi"];
    NSDictionary *parametersDict = @{
                                     @"city": @"成都"
                                     };
    
    [BGNetWorking BG_postRequestWithURL:url param:parametersDict completeBlock:^(NSData *obj, id error) {
        if (error)
        {
            NSError *er = (NSError *)error;
            NSLog(@"error: %@",er.localizedDescription);
        }
        else
        {
            NSString *str = [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
            NSLog(@"data: %@",str);
        }
    }];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

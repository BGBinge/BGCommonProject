//
//  ViewFrameVC.h
//  BGCommonProject
//
//  Created by 冉彬 on 2018/10/3.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import "BGBaseViewController.h"
#import "UIView+Frame.h"

@interface ViewFrameVC : BGBaseViewController


@property (weak, nonatomic) IBOutlet UIView *moveView;



@property (weak, nonatomic) IBOutlet UISlider *leftSlider;
@property (weak, nonatomic) IBOutlet UISlider *topSlider;
@property (weak, nonatomic) IBOutlet UISlider *maxXSlider;
@property (weak, nonatomic) IBOutlet UISlider *centerXSlider;
@property (weak, nonatomic) IBOutlet UISlider *widthSlider;
@property (weak, nonatomic) IBOutlet UISlider *frameXSlider;

@property (weak, nonatomic) IBOutlet UISlider *rightSlider;
@property (weak, nonatomic) IBOutlet UISlider *bottomSlider;
@property (weak, nonatomic) IBOutlet UISlider *maxYSlider;
@property (weak, nonatomic) IBOutlet UISlider *centerYSlider;
@property (weak, nonatomic) IBOutlet UISlider *heightSlider;
@property (weak, nonatomic) IBOutlet UISlider *frameYSlider;




@end

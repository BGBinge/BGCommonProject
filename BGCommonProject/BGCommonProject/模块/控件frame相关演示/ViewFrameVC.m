//
//  ViewFrameVC.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/10/3.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import "ViewFrameVC.h"

@interface ViewFrameVC ()

@property (nonatomic, strong) NSMutableArray *sliderAry;

@end

@implementation ViewFrameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIView+Frame";
    // 监听frame
    [self.moveView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    self.moveView.frame = CGRectMake(0, 100, 50, 50);
    
    // 添加slider变化方法
    for (UISlider *slider in self.sliderAry)
    {
        [slider addTarget:self action:@selector(sliderValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    }
    
}

// 监听KVO后会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"])
    {
        NSLog(@"self.moveView.y = %f", self.moveView.frameY);
        
        self.frameXSlider.value = self.moveView.frameX>100 ? 100 : self.moveView.frameX;
        self.frameYSlider.value = self.moveView.frameY>100 ? 100 : self.moveView.frameY;
        self.centerXSlider.value = self.moveView.centerX>100 ? 100 : self.moveView.centerX;
        self.centerYSlider.value = self.moveView.centerY>100 ? 100 : self.moveView.centerY;
        self.widthSlider.value = self.moveView.width>100 ? 100 : self.moveView.width;
        self.heightSlider.value = self.moveView.height>100 ? 100 : self.moveView.height;
        self.topSlider.value = self.moveView.top>100 ? 100 : self.moveView.top;
        self.bottomSlider.value = self.moveView.bottom>100 ? 100 : self.moveView.bottom;
        self.leftSlider.value = self.moveView.left>100 ? 100 : self.moveView.left;
        self.rightSlider.value = self.moveView.right>100 ? 100 : self.moveView.right;
        self.maxXSlider.value = self.moveView.maxX>100 ? 100 : self.moveView.maxX;
        self.maxYSlider.value = self.moveView.maxY>100 ? 100 : self.moveView.maxY;
        
        
        
        
        
    }
}

-(void)dealloc // ARC模式下
{
    // 移除监听
    [self.moveView removeObserver:self forKeyPath:@"frame"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sliderValueChangeAction:(UISlider *)slider
{
    if (slider == self.frameXSlider)
    {
        self.moveView.frameX = slider.value;
    }
    else if (slider == self.frameYSlider)
    {
        self.moveView.frameY = slider.value;
    }
    else if (slider == self.widthSlider)
    {
        self.moveView.width = slider.value;
    }
    else if (slider == self.heightSlider)
    {
        self.moveView.height = slider.value;
    }
    else if (slider == self.centerXSlider)
    {
        self.moveView.centerX = slider.value;
    }
    else if (slider == self.centerYSlider)
    {
        self.moveView.centerY = slider.value;
    }
    else if (slider == self.topSlider)
    {
        self.moveView.top = slider.value;
    }
    else if (slider == self.leftSlider)
    {
        self.moveView.left = slider.value;
    }
    else if (slider == self.bottomSlider)
    {
        self.moveView.bottom = slider.value;
    }
    else if (slider == self.rightSlider)
    {
        self.moveView.right = slider.value;
    }
    else if (slider == self.maxXSlider)
    {
        self.moveView.maxX = slider.value;
    }
    else if (slider == self.maxYSlider)
    {
        self.moveView.maxY = slider.value;
    }
}






#pragma mark - Get
-(NSMutableArray *)sliderAry
{
    if (!_sliderAry)
    {
        _sliderAry = [[NSMutableArray alloc] init];
        [_sliderAry addObject:self.leftSlider];
        [_sliderAry addObject:self.topSlider];
        [_sliderAry addObject:self.maxXSlider];
        [_sliderAry addObject:self.centerXSlider];
        [_sliderAry addObject:self.widthSlider];
        [_sliderAry addObject:self.frameXSlider];
        [_sliderAry addObject:self.rightSlider];
        [_sliderAry addObject:self.bottomSlider];
        [_sliderAry addObject:self.maxYSlider];
        [_sliderAry addObject:self.centerYSlider];
        [_sliderAry addObject:self.heightSlider];
        [_sliderAry addObject:self.frameYSlider];
    }
    return _sliderAry;
}


@end

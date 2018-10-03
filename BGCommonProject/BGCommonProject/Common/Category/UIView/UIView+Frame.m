//
//  UIView+Frame.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/10/3.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)


- (void)setFrameX:(CGFloat)frameX
{
    CGRect frame = self.frame;
    frame.origin.x = frameX;
    
    self.frame = frame;
}

- (void)setFrameY:(CGFloat)frameY
{
    CGRect frame = self.frame;
    frame.origin.y = frameY;
    
    self.frame = frame;
}


- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    
    self.frame = frame;
}

-(void)setMaxY:(CGFloat)maxY
{
    CGRect frame = self.frame;
    frame.origin.y = maxY - frame.size.height;
    self.frame = frame;
    
}

-(void)setMaxX:(CGFloat)maxX
{
    CGRect frame = self.frame;
    frame.origin.x = maxX - frame.size.width ;
    self.frame = frame;
    
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.size.height = frame.size.height - (top - frame.origin.y);
    frame.origin.y = top;
    
    self.frame = frame;
}

-(void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.size.width = frame.size.width - (left - frame.origin.x);
    frame.origin.x = left;
    
    self.frame = frame;
}

-(void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.size.height = bottom - frame.origin.y;
    self.frame = frame;
}

-(void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.size.width = right - frame.origin.x;
    self.frame = frame;
}


- (CGFloat)frameX
{
    return self.frame.origin.x;
}

- (CGFloat)frameY
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)maxY
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)maxX
{
    return self.frame.size.width + self.frame.origin.x;
}

-(CGFloat)centerX
{
    return self.center.x;
}

-(CGFloat)centerY
{
    return self.center.y;
}


- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}



@end

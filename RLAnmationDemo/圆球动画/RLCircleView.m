//
//  RLCircleView.m
//  RLAnmationDemo
//
//  Created by 饶磊 on 2020/4/15.
//  Copyright © 2020 RL. All rights reserved.
//

#import "RLCircleView.h"

@implementation RLCircleView

+(Class)layerClass{
    return [RLCircleLayer class];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.rlCircleLayer = [RLCircleLayer layer];
        self.rlCircleLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.rlCircleLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.rlCircleLayer];
    }
    return self;
}

@end

//
//  RLCircleViewController.m
//  RLAnmationDemo
//
//  Created by 饶磊 on 2020/4/15.
//  Copyright © 2020 RL. All rights reserved.
//

#import "RLCircleViewController.h"
#import "RLCircleView.h"
 
@interface RLCircleViewController ()

@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UILabel *currentValueLabel;
@property (strong,nonatomic) RLCircleView *cv;

@end

@implementation RLCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"圆球动画";

    [self.mySlider addTarget:self action:@selector(valuechanged:) forControlEvents:UIControlEventValueChanged];
 
    self.cv = [[RLCircleView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 320/2, self.view.frame.size.height/2 - 320/2, 320, 320)];
    [self.view addSubview:self.cv];
      
      //首次进入
      self.cv.rlCircleLayer.progress = _mySlider.value;
}

-(void)valuechanged:(UISlider *)sender{
    
    self.currentValueLabel.text = [NSString stringWithFormat:@"Current:  %f",sender.value];
    self.cv.rlCircleLayer.progress = sender.value;
}

 

@end

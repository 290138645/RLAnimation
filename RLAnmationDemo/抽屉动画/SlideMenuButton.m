//
//  SlideMenuButton.m
//  RLAnmationDemo
//
//  Created by 饶磊 on 2020/4/18.
//  Copyright © 2020 RL. All rights reserved.
//

#import "SlideMenuButton.h"

@interface SlideMenuButton ()

@property(nonatomic,strong)NSString *buttonTitle;

@end

@implementation SlideMenuButton


- (id)initWithTitle:(NSString *)title{
    self = [super init];
    if (self) {
        self.buttonTitle = title;
    }
    return self;
}

/**
 重绘作用：重写该方法以实现自定义的绘制内容
 空实现会对动画期间的性能产生负面影响。
 */
- (void)drawRect:(CGRect)rect{
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect); //画矩形
    [self.buttonColor set];
    CGContextFillPath(context); //填充路径
    
    //CGRectInset是以rect为中心，根据dx和dy来实现缩小。
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 1, 1) cornerRadius: rect.size.height/2];
    [self.buttonColor set];
    [path fill]; //此方法为填充方法
    [[UIColor whiteColor] setStroke];
    path.lineWidth = 1;
    [path stroke];
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy]; //段落样式
    style.alignment = NSTextAlignmentCenter;
     NSDictionary *attr = @{NSParagraphStyleAttributeName:style,NSFontAttributeName:[UIFont systemFontOfSize:24.0f],NSForegroundColorAttributeName:[UIColor whiteColor]};
    CGSize size = [self.buttonTitle sizeWithAttributes:attr];
       
    CGRect r = CGRectMake(rect.origin.x,
                             rect.origin.y + (rect.size.height - size.height)/2.0,
                             rect.size.width,
                             size.height);

    [self.buttonTitle drawInRect:r withAttributes:attr];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    NSInteger tapCount = touch.tapCount;
    switch (tapCount) {
        case 1:
            self.buttonClickBlock();
            break;
            
        default:
            break;
    }
}

@end

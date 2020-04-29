//
//  SlideMenuButton.h
//  RLAnmationDemo
//
//  Created by 饶磊 on 2020/4/18.
//  Copyright © 2020 RL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlideMenuButton : UIView

-(id)initWithTitle:(NSString *)title;
 
@property(nonatomic,strong)UIColor *buttonColor;
 
@property(nonatomic,copy)void(^buttonClickBlock)(void);

@end

NS_ASSUME_NONNULL_END

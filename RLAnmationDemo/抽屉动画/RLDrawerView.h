//
//  RLDrawerView.h
//  RLAnmationDemo
//
//  Created by 饶磊 on 2020/4/18.
//  Copyright © 2020 RL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MenuButtonClickedBlock)(NSInteger index,NSString *title,NSInteger titleCounts);


@interface RLDrawerView : UIView
 
-(id)initWithTitles:(NSArray *)titles;

-(id)initWithTitles:(NSArray *)titles withButtonHeight:(CGFloat)height withMenuColor:(UIColor *)menuColor withBackBlurStyle:(UIBlurEffectStyle)style;

-(void)trigger; //触发动画

@property(nonatomic,copy)MenuButtonClickedBlock menuClickBlock;  //点击回调


@end

NS_ASSUME_NONNULL_END

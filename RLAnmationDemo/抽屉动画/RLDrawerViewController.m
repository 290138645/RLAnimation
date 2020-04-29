//
//  RLDrawerViewController.m
//  RLAnmationDemo
//
//  Created by 饶磊 on 2020/4/15.
//  Copyright © 2020 RL. All rights reserved.
//

#import "RLDrawerViewController.h"
#import "RLDrawerView.h"

@interface RLDrawerViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tv;
@end

@implementation RLDrawerViewController{
    RLDrawerView *menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"抽屉动画";
    
    self.tv.delegate = self;
    self.tv.dataSource = self;
    
    menu = [[RLDrawerView alloc]initWithTitles:@[@"首页",@"消息",@"发布",@"发现",@"个人",@"设置"]];
       menu.menuClickBlock = ^(NSInteger index,NSString *title,NSInteger titleCounts){
           NSLog(@"index:%ld title:%@ titleCounts:%ld",index,title,titleCounts);
       };
}

- (IBAction)buttonTrigger:(id)sender {
    [menu trigger];
}


#pragma mark -- UITabel View Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"demoCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"demoCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"NO.%ld",(long)indexPath.row];
    return cell;
}

 

@end

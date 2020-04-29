//
//  HomeViewController.m
//  RLAnmationDemo
//
//  Created by 饶磊 on 2020/4/14.
//  Copyright © 2020 RL. All rights reserved.
//

#import "HomeViewController.h"
#import "RLCircleViewController.h"
#import "RLDrawerViewController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *listTableview;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation HomeViewController

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithObjects:@"圆球动画", @"抽屉动画",nil];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画合集";
    
    self.listTableview.dataSource= self;
    self.listTableview.delegate  = self;
}


 

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"listCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        RLCircleViewController *vc = [[RLCircleViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        RLDrawerViewController *vc = [[RLDrawerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
 

@end

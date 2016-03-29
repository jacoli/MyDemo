//
//  FrontViewController.m
//  MyDemo
//
//  Created by chuange.lcg on 16/3/29.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "FrontViewController.h"
#import "UrlRouter.h"
#import "FrontModel.h"
#import "ItemTableViewCell.h"

@interface FrontViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) FrontModel *model;;

@end

@implementation FrontViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ItemTableViewCell class] forCellReuseIdentifier:@"ItemModel"];
    }
    
    return _tableView;
}

- (FrontModel *)model {
    if (!_model) {
        _model = [[FrontModel alloc] init];
    }
    
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Front";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    self.tableView.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CGRectGetWidth([UIScreen mainScreen].bounds) / 2 + 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemModel *model = self.model.items[indexPath.row];
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemModel" forIndexPath:indexPath];
    cell.imgUrl = model.picPath;
    cell.title = model.title;
    cell.location = model.location;
    cell.price = [NSString stringWithFormat:@"%ld", [model.price longValue]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ItemModel *model = self.model.items[indexPath.row];
    UIViewController *vc = [[UrlRouter sharedInstance] viewControllerCreatedForUrl:[NSURL URLWithString:model.url]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

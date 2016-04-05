//
//  CellDataUpdater.m
//  MyDemo
//
//  Created by chuange.lcg on 16/4/5.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "CellDataUpdater.h"

@implementation CellDataUpdater

- (void)updateCell:(ItemTableViewCell *)cell withData:(ItemModel *)model {
    [cell.itemPicImageView sd_setImageWithURL:[NSURL URLWithString:model.picPath]];
    cell.titleLabel.text = model.title;
    cell.locationLabel.text = model.location;
    cell.priceLabel.text = [NSString stringWithFormat:@"%ld", [model.price longValue]];
}

@end

//
//  CellDataUpdater.h
//  MyDemo
//
//  Created by chuange.lcg on 16/4/5.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemTableViewCell.h"
#import "ItemModel.h"

@interface CellDataUpdater : NSObject

- (void)updateCell:(ItemTableViewCell *)cell withData:(ItemModel *)model;

@end

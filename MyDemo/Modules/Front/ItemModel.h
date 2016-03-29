//
//  ItemModel.h
//  MyDemo
//
//  Created by chuange.lcg on 16/3/29.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "TBJSONModel.h"

@interface ItemModel : TBJSONModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *picPath;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *itemId;
@property (nonatomic, copy) NSString *location;

@end

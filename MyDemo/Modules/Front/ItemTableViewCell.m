//
//  ItemTableViewCell.m
//  MyDemo
//
//  Created by chuange.lcg on 16/3/29.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "ItemTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ItemTableViewCell ()

@property (nonatomic, strong) UIImageView *itemPicImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation ItemTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.itemPicImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.priceLabel];
    }
    
    return self;
}

- (UIImageView *)itemPicImageView {
    if (!_itemPicImageView) {
        _itemPicImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    
    return _itemPicImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    
    return _titleLabel;
}

- (UILabel *)locationLabel {
    if (!_locationLabel) {
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    
    return _locationLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    
    return _priceLabel;
}

- (void)setImgUrl:(NSString *)imgUrl {
    [self.itemPicImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setLocation:(NSString *)location {
    self.locationLabel.text = location;
}

- (void)setPrice:(NSString *)price {
    self.priceLabel.text = price;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.itemPicImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds) / 2, CGRectGetWidth(self.contentView.bounds) / 2);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.itemPicImageView.frame), CGRectGetWidth(self.contentView.bounds), 20);
    self.locationLabel.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), CGRectGetWidth(self.contentView.bounds), 20);
    self.priceLabel.frame = CGRectMake(0, CGRectGetMaxY(self.locationLabel.frame), CGRectGetWidth(self.contentView.bounds), 20);
}

@end

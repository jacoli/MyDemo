//
//  FrontModel.m
//  MyDemo
//
//  Created by chuange.lcg on 16/3/29.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "FrontModel.h"

@implementation FrontModel

- (NSArray *)items {
    if (!_items) {
        _items = [self mockItems];
    }
    
    return _items;
}

- (NSArray *)mockItems {
    NSString *mockFilePath = [[NSBundle mainBundle] pathForResource:@"FrontMockData" ofType:@""];
    if (mockFilePath
        && [[NSFileManager defaultManager] fileExistsAtPath:mockFilePath]) {
        NSData *jsonData = [[NSData alloc] initWithContentsOfFile:mockFilePath];
        if (jsonData) {
            NSMutableArray *items = [[NSMutableArray alloc] init];
            id json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            if (json && [json isKindOfClass:[NSArray class]]) {
                for (id itemDict in json) {
                    if ([itemDict isKindOfClass:[NSDictionary class]]) {
                        ItemModel *model = [[ItemModel alloc] initWithJSONDictionary:itemDict];
                        if (model) {
                            [items addObject:model];
                        }
                    }
                }
            }
            return items;
        }
    }
    
    return @[];
}


@end

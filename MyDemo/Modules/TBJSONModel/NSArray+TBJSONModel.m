//
//  NSArray+TBMTOPModel.m
//  taobao4ipad
//
//  Created by Luke on 8/9/13.
//  Copyright (c) 2013 taobao. All rights reserved.
//

#import "NSArray+TBJSONModel.h"
#import "TBJSONModel.h"

@implementation NSArray(TBJSONModel)

- (NSArray *)modelArrayWithClass:(Class)modelClass{
    NSMutableArray *modelArray = [NSMutableArray array];
    for (id object in self) {
        if ([object isKindOfClass:[NSArray class]]) {
            NSArray *subModelArray = [object modelArrayWithClass:modelClass];
            if (subModelArray) {
                [modelArray addObject:subModelArray];
            }
        }else if ([object isKindOfClass:[NSDictionary class]]){
            id model = [[modelClass alloc] initWithJSONDictionary:object];
            if (model) {
                [modelArray addObject:model];
            }
        }else{
            [modelArray addObject:object];
        }
    }
    return modelArray;
}


- (NSArray *)toJSONArray{
    NSMutableArray *jsonArray = [NSMutableArray array];
    
    for (id object in self) {
        if ([object isKindOfClass:[TBJSONModel class]]) {
            NSDictionary *objectDict = [(TBJSONModel *)object toJSONDictionary];
            if (objectDict) {
                [jsonArray addObject:objectDict];
            }
        }else if ([object isKindOfClass:[NSArray class]]){
            NSArray *subJSONArray = [object toJSONArray];
            if (subJSONArray) {
                [jsonArray addObject:subJSONArray];
            }
        }else{
            [jsonArray addObject:object];
        }
    }
    
    return jsonArray;
}

@end

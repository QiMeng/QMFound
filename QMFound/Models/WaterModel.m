//
//  WaterModel.m
//  QMFound
//
//  Created by QiMENG on 1/23/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import "WaterModel.h"

@implementation WaterModel

+ (id) itemFromDic:(NSDictionary *)dic {
    
    WaterModel * model = [[WaterModel alloc]init];
    
    model.title = dic[@"title"];
    model.content = dic[@"content"];
    model.imageUrlStr = dic[@"url"];
    model.imgWidth = [dic[@"width"] floatValue];
    model.imgHeight = [dic[@"height"] floatValue];
    
    return model;
}

@end

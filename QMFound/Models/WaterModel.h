//
//  WaterModel.h
//  QMFound
//
//  Created by QiMENG on 1/23/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WaterModel : NSObject

@property (nonatomic, copy) NSString * title;       //标题
@property (nonatomic, copy) NSString * content;     //内容
@property (nonatomic, copy) NSString * imageUrlStr; //图片链接
@property (nonatomic, assign) float imgWidth;
@property (nonatomic, assign) float imgHeight;

+ (id) itemFromDic:(NSDictionary *)dic;

@end

//
//  QMWaterfallCell.h
//  QMFound
//
//  Created by QiMENG on 1/23/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterModel;

@interface WaterfallCell : UICollectionViewCell {
    
}

/**
 *  图片
 */
@property (nonatomic, strong) UIImageView * iconImageView;

/**
 *  底部显示内容
 */
@property (nonatomic, strong) UILabel * contentLabel;

/**
 *  数据详情
 */
@property (nonatomic, strong) WaterModel * water;


/**
 *  cell 的宽高
 */
+ (CGSize)cellSize:(WaterModel *)aModel withWidth:(CGFloat)aWidth;

@end

//
//  QMWaterfallCell.m
//  QMFound
//
//  Created by QiMENG on 1/23/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import "WaterfallCell.h"

#import "WaterModel.h"

#import "QMHelper.h"

#import <UIImageView+WebCache.h>

#define kContentLabelFont [UIFont systemFontOfSize:13]

@implementation WaterfallCell

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
        
        self.iconImageView.frame = frame;
        
        [self.contentView addSubview:self.iconImageView];
    }
    return self;
}

- (UIImageView *)iconImageView {
    
    if (_iconImageView) {
        
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView.clipsToBounds = YES;
        imageView.backgroundColor = [UIColor greenColor];
        _iconImageView = imageView;
    }
    
    return _iconImageView;
}

- (UILabel *)contentLabel {
    
    if (_contentLabel) {
        
        UILabel * label = [[UILabel alloc]init];
        
        label.font = kContentLabelFont;
        
        _contentLabel = label;
    }
    
    return _contentLabel;
}

- (void)setWater:(WaterModel *)water{
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:water.imageUrlStr]
                          placeholderImage:[UIImage imageNamed:@""]];
    
    self.contentLabel.text = water.content;
    
}

+ (CGSize)cellSize:(WaterModel *)aModel withWidth:(CGFloat)aWidth{
    
#warning 根据数据计算出列表的宽高
    CGSize size = [QMHelper sizeAccordingText:aModel.content font:kContentLabelFont width:aWidth];
    
    return size;
}



@end

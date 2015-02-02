//
//  QMHelper.m
//  QMFound
//
//  Created by QiMENG on 1/23/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import "QMHelper.h"

@implementation QMHelper


+ (CGSize)sizeAccordingText:(NSString *)text font:(UIFont *)font width:(float)width {
    
    CGSize size = CGSizeMake(width,FLT_MAX);
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize retSize = [text boundingRectWithSize:size
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}

@end

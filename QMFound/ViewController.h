//
//  ViewController.h
//  QMFound
//
//  Created by QiMENG on 1/23/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CHTCollectionViewWaterfallLayout.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>


@property (nonatomic, strong) UICollectionView * myCollectionView;


@end


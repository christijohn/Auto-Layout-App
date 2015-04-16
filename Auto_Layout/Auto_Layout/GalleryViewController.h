//
//  GalleryViewController.h
//  Auto_Layout
//
//  Created by Christi John on 24/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

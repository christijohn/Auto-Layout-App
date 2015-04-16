//
//  GalleryHeaderView.h
//  Auto_Layout
//
//  Created by Christi John on 02/03/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryHeaderView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *imageArray;
@end

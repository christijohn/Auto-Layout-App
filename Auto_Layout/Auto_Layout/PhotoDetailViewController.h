//
//  PhotoDetailViewController.h
//  Auto_Layout
//
//  Created by Christi John on 19/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)backAction:(id)sender;

@end

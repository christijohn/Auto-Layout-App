//
//  GalleryHeaderView.m
//  Auto_Layout
//
//  Created by Christi John on 02/03/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import "GalleryHeaderView.h"
#import "GallryHeaderCell.h"

#define kGAlleryHeaderCellId @"GalleryHeaderCellId"


@implementation GalleryHeaderView

- (void)awakeFromNib {
    // Initialization code
    _imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"],[UIImage imageNamed:@"6.jpg"], nil];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"GallryHeaderCell" bundle:nil] forCellWithReuseIdentifier:kGAlleryHeaderCellId];
    [_collectionView reloadData];
}

#pragma mark -
#pragma mark - UICollectioView Delegate
#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [_imageArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GallryHeaderCell *galleryCell = (GallryHeaderCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kGAlleryHeaderCellId forIndexPath:indexPath];
    galleryCell.imageView.image = [_imageArray objectAtIndex:indexPath.row];
    
    return galleryCell;
}

@end

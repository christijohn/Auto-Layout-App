//
//  GalleryViewController.m
//  Auto_Layout
//
//  Created by Christi John on 24/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleryHeaderView.h"
#import "GalleryItemCell.h"

#define kGalleryHeaderViewId @"kGAlleryHeaderViewId"
#define kGalleryItemCellId @"GalleryItemCellId"

@interface GalleryViewController (){
    
    NSArray *_imageArray;
}

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"],[UIImage imageNamed:@"6.jpg"], nil];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"GalleryItemCell" bundle:nil] forCellWithReuseIdentifier:kGalleryItemCellId];
    //[self.collectionView registerClass:[GalleryHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kGalleryHeaderViewId];
    [self.collectionView registerNib:[UINib nibWithNibName:@"GalleryHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kGalleryHeaderViewId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - UICollectioView Delegate
#pragma mark -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [_imageArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GalleryItemCell *galleryCell = [collectionView dequeueReusableCellWithReuseIdentifier:kGalleryItemCellId forIndexPath:indexPath];
    
    return galleryCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
       
        GalleryHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kGalleryHeaderViewId forIndexPath:indexPath];
        
        reusableview = headerView;
    }
    
    return reusableview;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  PhotoDetailViewController.m
//  Auto_Layout
//
//  Created by Christi John on 19/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "PhotoDetailCollectionViewCell.h"

#define kPhotoDetailCellId @"PhotoDetailcellId"

@interface PhotoDetailViewController ()

@property(nonatomic,strong) NSArray *imageArray;
@property(nonatomic,strong) PhotoDetailCollectionViewCell *photoDetailCell;

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"],[UIImage imageNamed:@"6.jpg"], nil];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoDetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kPhotoDetailCellId];
    
    NSLog(@"Iam in ViewdidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 
#pragma mark - UICollectioView Delegate
#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [_imageArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _photoDetailCell = [collectionView dequeueReusableCellWithReuseIdentifier:kPhotoDetailCellId forIndexPath:indexPath];
    _photoDetailCell.imageView.image = [_imageArray objectAtIndex:indexPath.row];
   
    
    return _photoDetailCell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return ;
//}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[PhotoDetailCell]|" options:0 metrics:nil views:@{ @"PhotoDetailCell": cell.contentView }]];
    [self.collectionView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[PhotoDetailCell]|" options:0 metrics:nil views:@{ @"PhotoDetailCell": cell.contentView }]];


}

@end

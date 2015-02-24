//
//  PhotoListViewController.m
//  Auto_Layout
//
//  Created by Christi John on 13/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import "PhotoListViewController.h"
#import "PhotoTableViewCell.h"
#import "PhotoDetailViewController.h"

#define kPhotoCellIdentifier @"kPhotoCellIdentifier"
#define kPhotoDetailVC @"kPhotoDetailVC"

#define iPhone6 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6Plus ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 736)
#define iPhone5 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)

@interface PhotoListViewController ()

@end

@implementation PhotoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PhotoTableViewCell" bundle:nil] forCellReuseIdentifier:kPhotoCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark - UITableView Datasource
#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPhotoCellIdentifier];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(iPhone6Plus)  return 366.0f;
    else if(iPhone6) return 332.0f;
    else             return 283.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoDetailViewController *photoDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:kPhotoDetailVC];
    [self.navigationController pushViewController:photoDetailVC animated:YES];
    
}

@end

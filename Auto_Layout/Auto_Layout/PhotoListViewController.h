//
//  PhotoListViewController.h
//  Auto_Layout
//
//  Created by Christi John on 13/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)backAction:(id)sender;

@end

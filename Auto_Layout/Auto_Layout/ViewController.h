//
//  ViewController.h
//  Auto_Layout
//
//  Created by Christi John on 11/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end


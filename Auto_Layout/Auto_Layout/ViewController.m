//
//  ViewController.m
//  Auto_Layout
//
//  Created by Christi John on 11/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import "ViewController.h"
#import "NewsTableViewCell.h"
#import "PhotoListViewController.h"

#define kNewsCellIdentifier @"kNewsCellIdentifier"
#define kPhotoListVC @"kPhotoListVC"

@interface ViewController ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NewsTableViewCell *prototypeCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:kNewsCellIdentifier];
    _items = @[@"How do you use Auto Layout within UITableViewCells in a table view to let each cell's content",@"In your UITableViewCell subclass, add constraints so that the subviews of the cell have their edges pinned to the edges of the cell's contentView (most importantly to the top AND bottom edges). NOTE",@"Remember, the idea is to have the cell's subviews connected vertically",@"You can imagine that as more text is added to the multi-line body label in the example cell above, it will need to grow vertically to fit the text, which will effectively force the cell to grow in height. (Of course, you need to get the constraints right in order for this to work correctly!)",@"Getting your constraints right is definitely",@"dynamic cell heights working with Auto Layout.",@"Its working macha...!!!"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
}

- (IBAction)backAcrtion:(id)sender {
}


#pragma mark - PrototypeCell

- (NewsTableViewCell *)prototypeCell
{
    if (!_prototypeCell) {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:kNewsCellIdentifier];
    }
    
    return _prototypeCell;
}

#pragma mark - Configure
- (void)configureCell:(NewsTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *quote = self.items[indexPath.row];
    
    cell.descLabel.text = quote;
}

#pragma mark -
#pragma mark - UITableView Datasource
#pragma mark - 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewsCellIdentifier];

    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.prototypeCell.bounds = CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));
    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
    
    [self.prototypeCell updateConstraintsIfNeeded];
    [self.prototypeCell layoutIfNeeded];
    
    CGFloat height = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 33;
    return (height < 105)? 105:height;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PhotoListViewController *photoList = [mainStoryBoard instantiateViewControllerWithIdentifier:kPhotoListVC];
    [self.navigationController pushViewController:photoList animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

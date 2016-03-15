//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by Francisco Magdaleno on 1/17/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "MenuTVC.h"
//controllers
#import "TwoSquaresVC.h"
#import "FillViewVC.h"
#import "AlignedSquaresVC.h"

@interface MenuTVC ()

///Options to display in the table view as datasource
@property (nonatomic,strong) NSArray *options;

@end

@implementation MenuTVC

static NSString *const kCellIdentifier = @"testCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.options = @[@"Fill view",
                     @"Two squares to edges",
                     @"Aligned squares"];
}

#pragma mark -TableView Data source
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:kCellIdentifier];
    }
    cell.textLabel.text = self.options[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self showFillViewDemo];
            break;
        case 1:
            [self showTwoSquareDemo];
            break;
        case 2:
            [self showAlignedSquaresDemo];
            break;
        default:
            break;
    }
}

#pragma mark -Presentation views methods
- (void)showFillViewDemo {
    FillViewVC *controller = [[FillViewVC alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)showTwoSquareDemo {
    TwoSquaresVC *controller = [[TwoSquaresVC alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)showAlignedSquaresDemo {
    AlignedSquaresVC *controller = [[AlignedSquaresVC alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

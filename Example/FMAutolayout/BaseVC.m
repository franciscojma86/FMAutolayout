//
//  BaseVC.m
//  Portfolio
//
//  Created by Francisco Magdaleno on 1/17/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "BaseVC.h"
#import "UIView+FMAutolayout.h"

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.translucent = NO;
}


- (UIView *)blueView {
    if (!_blueView) {
        _blueView = [UIView autoLayoutView];
        [_blueView setBackgroundColor:[UIColor blueColor]];
    }
    return _blueView;
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [UIView autoLayoutView];
        [_redView setBackgroundColor:[UIColor redColor]];
    }
    return _redView;
}

- (UIView *)blackView {
    if (!_blackView) {
        _blackView = [UIView autoLayoutView];
        [_blackView setBackgroundColor:[UIColor blackColor]];
    }
    return _blackView;
}
@end

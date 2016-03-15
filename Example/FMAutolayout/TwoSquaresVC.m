//
//  AutoLayoutVC.m
//  Portfolio
//
//  Created by Francisco Magdaleno on 1/12/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "TwoSquaresVC.h"
#import "UIView+FMAutolayout.h"


@implementation TwoSquaresVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Add views first
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.redView];
    
    //Top, and sides edges aligned to super view
    [self.view alignSubview:self.redView
                     offset:20
                 multiplier:1.0
                      edges:ConstraintEdgesTop |
     ConstraintEdgesBottom |
     ConstraintEdgesLeft
                     active:YES];
    
    [self.view alignSubview:self.blueView
                     offset:20
                 multiplier:1.0
                      edges:ConstraintEdgesTop |
     ConstraintEdgesRight |
     ConstraintEdgesBottom
                     active:YES];
    
    //Blue view leading the red
    [self.view arrangeView:self.blueView
                    toView:self.redView
                    offset:20
                multiplier:1.0
                  position:ConstraintPositionsToLead
                    active:YES];
    
    //Make blue square be double the width of red queare
    [self.view alignView:self.blueView
                  toView:self.redView
                  offset:0.0
              multiplier:2.0
              dimensions:ConstraintDimensionsWidth
                  active:YES];
    
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end

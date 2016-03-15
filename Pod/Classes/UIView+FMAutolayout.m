//
//  UIView+Autolayout.m
//  Portfolio
//
//  Created by Francisco Magdaleno on 1/12/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "UIView+FMAutolayout.h"

@implementation UIView (Autolayout)

#pragma mark -View creation
+ (UIView *)autoLayoutView {
    UIView *view = [[UIView alloc]init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

+ (void)activateConstraints:(NSArray<NSLayoutConstraint *> *)constraints {
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = YES;
    }
}

+ (void)deactivateConstraints:(NSArray<NSLayoutConstraint *> *)constraints {
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = NO;
    }
}

#pragma mark -Fill subview
- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                                       active:(BOOL)active {
    return [self alignView:subView
                    toView:self
                    offset:0.0
                multiplier:1.0
                     edges:ConstraintEdgesTop |
            ConstraintEdgesRight |
            ConstraintEdgesBottom |
            ConstraintEdgesLeft
                    active:active];
}

- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                                overalloffset:(CGFloat)overalloffset
                                       active:(BOOL)active {
    return [self alignView:subView
                    toView:self
                    offset:overalloffset
                multiplier:1.0
                     edges:ConstraintEdgesTop |
            ConstraintEdgesRight |
            ConstraintEdgesBottom |
            ConstraintEdgesLeft
                    active:active];
}

- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                                overalloffset:(CGFloat)overalloffset
                                   multiplier:(CGFloat)multiplier
                                       active:(BOOL)active {
    return [self alignView:subView
                    toView:self
                    offset:overalloffset
                multiplier:multiplier
                     edges:ConstraintEdgesTop |
            ConstraintEdgesRight |
            ConstraintEdgesBottom |
            ConstraintEdgesLeft
                    active:active];
}

#pragma mark -Dimensions
- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                  dimensions:(ConstraintDimensions)dimensions
                                      active:(BOOL)active {
    return [self alignView:view1
                    toView:view2
                    offset:0.0
                multiplier:1.0
                dimensions:dimensions
                    active:active];
}

- (NSArray<NSLayoutConstraint *> *)changeDimensions:(ConstraintDimensions)dimensions
                                               size:(CGFloat)size
                                             active:(BOOL)active {
    NSMutableArray *constraints = [NSMutableArray array];
    NSLayoutConstraint *constraint = nil;
    if (dimensions & ConstraintDimensionsWidth) {
        constraint = [NSLayoutConstraint constraintWithItem:self
                                                  attribute:NSLayoutAttributeWidth
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:nil
                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                 multiplier:1.0
                                                   constant:size];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (dimensions & ConstraintDimensionsHeight) {
        constraint = [NSLayoutConstraint constraintWithItem:self
                                                  attribute:NSLayoutAttributeHeight
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:nil
                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                 multiplier:1.0
                                                   constant:size];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                      offset:(CGFloat)offset
                                  multiplier:(CGFloat)multiplier
                                  dimensions:(ConstraintDimensions)dimensions
                                      active:(BOOL)active {
    NSMutableArray *constraints = [NSMutableArray array];
    NSLayoutConstraint *constraint = nil;
    if (dimensions & ConstraintDimensionsWidth) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeWidth
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeWidth
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (dimensions & ConstraintDimensionsHeight) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeHeight
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeHeight
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    
    [self addConstraints:constraints];
    return constraints;
}

#pragma mark -Align edges
- (NSArray<NSLayoutConstraint *> *)alignSubview:(UIView *)subview
                                          edges:(ConstraintEdges)edges
                                         active:(BOOL)active {
    NSArray *constraints = [self alignView:subview
                                    toView:self
                                    offset:0.0
                                multiplier:1.0
                                     edges:edges
                                    active:active];
    return constraints;
}


- (NSArray<NSLayoutConstraint *> *)alignSubview:(UIView *)subview
                                         offset:(CGFloat)offset
                                     multiplier:(CGFloat)multiplier
                                          edges:(ConstraintEdges)edges
                                         active:(BOOL)active {
    NSArray *constraints = [self alignView:subview
                                    toView:self
                                    offset:offset
                                multiplier:multiplier
                                     edges:edges
                                    active:active];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                       edges:(ConstraintEdges)edges
                                      active:(BOOL)active {
    NSArray *constraints = [self alignView:view1
                                    toView:view2
                                    offset:0.0
                                multiplier:1.0
                                     edges:edges
                                    active:active];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                      offset:(CGFloat)offset
                                  multiplier:(CGFloat)multiplier
                                       edges:(ConstraintEdges)edges
                                      active:(BOOL)active {
    NSMutableArray *constraints = [NSMutableArray array];
    NSLayoutConstraint *constraint = nil;
    if (edges & ConstraintEdgesTop) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeTop
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeTop
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (edges & ConstraintEdgesBottom) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:multiplier
                                                   constant:-offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (edges & ConstraintEdgesRight) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeTrailing
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeTrailing
                                                 multiplier:multiplier
                                                   constant:-offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (edges & ConstraintEdgesLeft) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeLeading
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeLeading
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (edges & ConstraintEdgesBaseline) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeBaseline
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeBaseline
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    [self addConstraints:constraints];
    return constraints;
    
}


#pragma mark -Centers
- (NSArray<NSLayoutConstraint *> *)alignSubView:(UIView *)subView
                                        centers:(ConstraintCenters)centers
                                         active:(BOOL)active {
    return [self alignView:subView
                    toView:self
                    offset:0.0
                multiplier:1.0
                   centers:centers
                    active:active];
}

- (NSArray<NSLayoutConstraint *> *)alignSubView:(UIView *)subView
                                         offset:(CGFloat)offset
                                     multiplier:(CGFloat)multiplier
                                        centers:(ConstraintCenters)centers
                                         active:(BOOL)active {
    return [self alignView:subView
                    toView:self
                    offset:offset
                multiplier:multiplier
                   centers:centers
                    active:active];
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                     centers:(ConstraintCenters)centers
                                      active:(BOOL)active {
    return [self alignView:view1
                    toView:view2
                    offset:0.0
                multiplier:1.0
                   centers:centers
                    active:active];
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                      offset:(CGFloat)offset
                                  multiplier:(CGFloat)multiplier
                                     centers:(ConstraintCenters)centers
                                      active:(BOOL)active {
    NSMutableArray *constraints = [NSMutableArray array];
    NSLayoutConstraint *constraint = nil;
    if (centers & ConstraintCentersX) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeCenterX
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeCenterX
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (centers & ConstraintCentersY) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeCenterY
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeCenterY
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    
    [self addConstraints:constraints];
    return constraints;
}

#pragma mark -Position
- (NSArray<NSLayoutConstraint *> *)arrangeView:(UIView *)view1
                                        toView:(UIView *)view2
                                      position:(ConstraintPositions)positions
                                        active:(BOOL)active {
    return [self arrangeView:view1
                      toView:view2
                      offset:0.0
                  multiplier:1.0
                    position:positions
                      active:active];
}

- (NSArray<NSLayoutConstraint *> *)arrangeView:(UIView *)view1
                                        toView:(UIView *)view2
                                        offset:(CGFloat)offset
                                    multiplier:(CGFloat)multiplier
                                      position:(ConstraintPositions)positions
                                        active:(BOOL)active {
    NSMutableArray *constraints = [NSMutableArray array];
    NSLayoutConstraint *constraint = nil;
    
    if (positions & ConstraintPositionsBelow) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeTop
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (positions & ConstraintPositionsOnTop) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeTop
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (positions & ConstraintPositionsToLead) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeLeading
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeTrailing
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    if (positions & ConstraintPositionsToTrail) {
        constraint = [NSLayoutConstraint constraintWithItem:view1
                                                  attribute:NSLayoutAttributeTrailing
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:view2
                                                  attribute:NSLayoutAttributeLeading
                                                 multiplier:multiplier
                                                   constant:offset];
        constraint.active = active;
        [constraints addObject:constraint];
    }
    
    [self addConstraints:constraints];
    return constraints;
}

@end


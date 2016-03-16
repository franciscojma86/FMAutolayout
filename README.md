# FMAutolayout

[![CI Status](http://img.shields.io/travis/franciscojma86/FMAutolayout.svg?style=flat)](https://travis-ci.org/franciscojma86/FMAutolayout)
[![Version](https://img.shields.io/cocoapods/v/FMAutolayout.svg?style=flat)](http://cocoapods.org/pods/FMAutolayout)
[![License](https://img.shields.io/cocoapods/l/FMAutolayout.svg?style=flat)](http://cocoapods.org/pods/FMAutolayout)
[![Platform](https://img.shields.io/cocoapods/p/FMAutolayout.svg?style=flat)](http://cocoapods.org/pods/FMAutolayout)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FMAutolayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FMAutolayout"
```

#UIView+Autolayout 
This is a category on UIView created for making Auto Layout constraints in code easily. While making constraints from IB is pretty straightforward, if you want to make any changes on the constraints, you need to make a lot of IBOutlets, and sometimes, you just need to create new constraints from code.

Using UIView+Autolayout is very simple, but you must still follow the Auto Layout basics:
- Before adding any constraints, the view must be already added to a superview
- Layout constraints between 2 views must be added to a superview they have in common
- Call -layoutIfNeeded from the superview to layout the constraints and see the effects

####Creating a constraint

There are 4 types of constraints this category can generate for you
- Edges alignment
- Centers alignment
- Dimensions alignment
- Relative positions

#####Edges alignment

To align the edges of a view with it's parent view call -alignSubview:edges:apply
Make sure you pass the edges you wish to align. Inspect the enums in the .h
Sending :apply as YES, will add the constraints to the calling view in the same call. If you want to only generate the constraints, and save them to add them later, send it as NO.
```
//Create a constraint to attach the subview at the top of the superview. Apply it to the calling view now.
[parentView alignSubview:subView edges:ConstraintEdgesTop apply:YES];

//Create a constraint to align two views' bottom and top edge. Don't apply it yet.
NSArray *constraints = [parentView alignView:view1 toView:view2 edges:ConstraintEdgesTop | ConstraintEdgesBottom apply:NO];
```

#####Centers alignment

Follow the same instructions and logic as the edge alignments.

```
//Align the subview to the center of the superview.
[parentView alignSubView:subview centers:ConstraintCentersX | ConstraintsCenterY apply:YES];
```

#####Dimensions alignment

You can align two views to have same height and/or width with any offset or multiplier value with oen simple call. Remember that these constraints must be added to a parent view they have in common.

```
//Make the view1 twice as big as view2.
[parentView alignView:view1 toView:view2 offset:0.0 multiplier:2.0 dimensions:ConstraintDimensionsWidth | ConstraintDimensionsHeight apply:YES];
```

#####Relative positions

With these methods you can easily position any view relative to another view, i.e. "On top of view", "Leading view", etc.

```
//Make view2 lead(be in front, or "to the right") of view1 by 20 points
[parentView arrangeView:view2 toView:view1 offset:20.0 multiplier:1.0 position:ConstraintPositionToLead apply:YES];
```


Hope this helps making constraints more fun! Any feedback or suggestions email me at franciscojma86@gmail.com
Thanks!

## Author

franciscojma86, franciscojma86@gmail.com

## License

FMAutolayout is available under the MIT license. See the LICENSE file for more info.

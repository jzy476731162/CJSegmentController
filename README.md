# CJSegmentController

[![CI Status](http://img.shields.io/travis/Ji zhongyi/CJSegmentController.svg?style=flat)](https://travis-ci.org/Ji zhongyi/CJSegmentController)
[![Version](https://img.shields.io/cocoapods/v/CJSegmentController.svg?style=flat)](http://cocoapods.org/pods/CJSegmentController)
[![License](https://img.shields.io/cocoapods/l/CJSegmentController.svg?style=flat)](http://cocoapods.org/pods/CJSegmentController)
[![Platform](https://img.shields.io/cocoapods/p/CJSegmentController.svg?style=flat)](http://cocoapods.org/pods/CJSegmentController)

## Description
As it named, CJSegmentController is a UIViewController with a segmentControl, you would meet a lot of trouble when this SegmentControl's subviews have different Bar button Item. This pod is create For this Question.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Usage
 - import < CJViewController >
 - use ```- (instancetype)initWithViewControllers:(NSArray *)viewControllers TintColor:(UIColor *)tintColor;```
 - if you want to add bar button in navigationBar, import the Category:`UIViewController+BarButtonItem`,and manage your barButton by your subViewController like `TestVCTwo` in Demo.

## Installation

CJSegmentController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CJSegmentController"
```

## Author

Ji zhongyi, jizhongyi@lngtop.com

## License

CJSegmentController is available under the MIT license. See the LICENSE file for more info.

## Demo
![CJSegmentControllerDemo](CJSegmentController.gif)

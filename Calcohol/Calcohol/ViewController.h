//
//  ViewController.h
//  Calcohol
//
//  Created by dbk-dev on 11/19/14.
//  Copyright (c) 2014 David Krasnove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) UITextField *beerPercentTextField;
@property (weak, nonatomic) UISlider *beerCountSlider;
@property (weak, nonatomic) UILabel *resultLabel;
@property (weak, nonatomic) UILabel *drinkCountLabel;

@end


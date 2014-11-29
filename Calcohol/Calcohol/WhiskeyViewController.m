//
//  WhiskeyViewController.m
//  Calcohol
//
//  Created by dbk-dev on 11/20/14.
//  Copyright (c) 2014 David Krasnove. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Whiskey", @"whiskey");
}




-(void)buttonPressed:(UIButton *)sender;

{
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12; //assume they are 12oz Beer Bottles
    
    float alcoholPecentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPecentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskeyGlass = 1; // a 1oz shot
    float alcoholPercentageOfWhiskey = 0.4; //40 percent is average
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivolentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    NSString *beerText;
    
    if (numberOfBeers <= 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
        
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
        
    }
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivolentAlcoholAmount <= 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
        
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }


    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of whiskey.", nil),numberOfBeers, beerText, numberOfWhiskeyGlassesForEquivolentAlcoholAmount, whiskeyText];
    self.resultLabel.text = resultText;
    
    
    NSString *finalResult = [NSString stringWithFormat:NSLocalizedString(@"%.1f %@ of whiskey",nil), numberOfWhiskeyGlassesForEquivolentAlcoholAmount, whiskeyText];
    
    self.title = finalResult;
    
    
    
}


@end

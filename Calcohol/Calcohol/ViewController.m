//
//  ViewController.m
//  Calcohol
//
//  Created by dbk-dev on 11/19/14.
//  Copyright (c) 2014 David Krasnove. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>


@property (weak, nonatomic) UIButton *calculateButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;


@end

@implementation ViewController
-(void)loadView {
    //Allocate and initialize the all encompassing view
    self.view = [[UIView alloc]init];
    
    //Allocate and initialize each of our views and the gesture recognizer
    UITextField *textField = [[UITextField alloc]init];
    UISlider *slider = [[UISlider alloc]init];
    UILabel *label = [[UILabel alloc]init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    
    //Add each view and the gesture recognizer as the view's subviews
    
    [self.view addSubview:textField];
    [self.view addSubview:slider];
    [self.view addSubview:label];
    [self.view addSubview:button];
    [self.view addGestureRecognizer:tap];
    
    //Assign the views and gesture recognizer to our properties
    
    self.beerPercentTextField = textField;
    self.beerCountSlider = slider;
    self.resultLabel = label;
    self.calculateButton = button;
    self.hideKeyboardTapGestureRecognizer = tap;
    self.drinkCountLabel = label;
    
   
    
}



- (void)viewDidLoad {
    
    
    [super viewDidLoad];

    //set our primary view's babkgound color to lightGrayColor
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // Tells the text field that 'self', this instance of 'ViewController' should be treated as the text field's delgate - Need some help with this - talk to Steve
    self.beerPercentTextField.delegate = self;
    
    // set the placeholder text
    self.beerPercentTextField.placeholder = NSLocalizedString(@"%Alcohol Content per Beer", @"Beer precent placeholder text");
    
    //set beerPercentTextField background color
    self.beerPercentTextField.backgroundColor = [UIColor whiteColor];
    
    //Tells self.beerCountSlider that when its value changes it should call '[self -sliderValueDidChange:]'.
    //Equivolent to connecting the IBAction in th previous checkpoint
    
    [self.beerCountSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    // Set the minimum and max number of beers
    self.beerCountSlider.minimumValue = 1;
    self.beerCountSlider.maximumValue = 10;
    
    // Tells 'self.calculateButton' that when a finger is lifted from the button while still inside its bounds to call `[self.buttonPressed]`;
    
    [self.calculateButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Set the title of the button
    [self.calculateButton  setTitle:NSLocalizedString(@"Calculate", @"Calculate command") forState:UIControlStateNormal];
    
    
    //set the color of the button
    self.calculateButton.backgroundColor = [UIColor blueColor];
   
    
    // Tells the tap gesture recognizer to call `[self tapGestureDidFire:]` when it detects a tap.
    [self.hideKeyboardTapGestureRecognizer addTarget:self action:@selector(tapGestureDidFire:)];
    
    // Gets rid of the maximum number of lines on the label
    self.resultLabel.numberOfLines = 0;
    
    // Change the font name
    
    self.resultLabel.font =  [UIFont fontWithName:@"Georgia" size:24];
    
    


}




-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CGFloat viewWidth = screenRect.size.width;
#if 0
    if (UIInterfaceOrientationIsLandscape(UIInterfaceOrientationLandscapeLeft)){
        
        viewWidth = 480;
     
    } else {
        
        viewWidth = 320;
    }
#endif
        
    CGFloat padding = 20;
    CGFloat itemWidth = viewWidth - padding - padding;
    CGFloat itemHeight = 44;
    
    self.beerPercentTextField.frame = CGRectMake(padding, padding, itemWidth, itemHeight);
    
    CGFloat bottomOfTextField = CGRectGetMaxY(self.beerPercentTextField.frame);
    self.beerCountSlider.frame = CGRectMake(padding, bottomOfTextField + padding, itemWidth, itemHeight);
    
    CGFloat bottomOfSlider = CGRectGetMaxY(self.beerCountSlider.frame);
    self.resultLabel.frame = CGRectMake(padding, bottomOfSlider + padding, itemWidth, itemHeight * 4);
    self.drinkCountLabel.frame = CGRectMake(padding, bottomOfSlider + padding, itemWidth, itemHeight * 2);
   
    
    CGFloat bottomOfLabel = CGRectGetMaxY(self.resultLabel.frame);
    self.calculateButton.frame = CGRectMake(padding, bottomOfLabel + padding, itemWidth, itemHeight);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidChange:(UITextField *)sender {
    // Make sure the text is a number
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    
    if (enteredNumber == 0) {
        // The user typed 0, or something that's not a number, so clear the field
        sender.text = nil;
    }
}

- (void)sliderValueDidChange:(UISlider *)sender {
    // Adding count of drinks to label
    NSString *drinkCount = [NSString stringWithFormat:NSLocalizedString(@"%f alcohlic drinks consumed",nil), sender.value];
    //NSLog(@" %@", drinkCount);
    self.drinkCountLabel.text = drinkCount;
    [self.beerPercentTextField resignFirstResponder];
    
  }

- (void)buttonPressed:(UIButton *)sender {
    
    [self.beerPercentTextField resignFirstResponder];
    
    // first, calculate how much alcohol is in all those beers...
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    // now, calculate the equivalent amount of wine...
    
    float ouncesInOneWineGlass = 5;  // wine glasses are usually 5oz
    float alcoholPercentageOfWine = 0.13;  // 13% is average
    
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    // generate the result text, and display it on the label
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText, numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
}

- (void)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

    


    


@end




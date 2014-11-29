//
//  MainMenuViewController.m
//  Calcohol
//
//  Created by dbk-dev on 11/28/14.
//  Copyright (c) 2014 David Krasnove. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ViewController.h"
#import "WhiskeyViewController.h"

@interface MainMenuViewController ()

@property (weak, nonatomic) UIButton *wineButton;
@property (weak, nonatomic) UIButton *whiskeyButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;

@end

@implementation MainMenuViewController

-(void)loadView {
    self.view = [[UIView alloc]init];
  
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    
   
    [self.view addSubview:button];
    [self.view addSubview:button1];
   
    [self.view addGestureRecognizer:tap];
    
    //Assign the views and gesture recognizer to our properties
    
    self.wineButton = button;
    self.whiskeyButton = button1;
    
   
  
    
    
    
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
    
    CGFloat padding = 30;
    CGFloat itemWidth = viewWidth - padding - padding;
    CGFloat itemHeight = 44;
    
    self.wineButton.frame = CGRectMake(padding, padding + 40, itemWidth, itemHeight);
    
    CGFloat bottomOfWineButton = CGRectGetMaxY(self.wineButton.frame);
    self.whiskeyButton.frame = CGRectMake(padding, bottomOfWineButton + padding, itemWidth, itemHeight);
    
    
}

- (void) winePressed:(UIButton *) sender {
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

- (void) whiskeyPressed:(UIButton *) sender {
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set our primary view's babkgound color to lightGrayColor
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    self.title = NSLocalizedString(@"Select Alcohol", @"Alcolator");
    
    // Set the title of the button
    [self.wineButton setTitle:NSLocalizedString(@"Wine", @"Wine") forState:UIControlStateNormal];
    
    
   
    [self.whiskeyButton setTitle:NSLocalizedString(@"Whiskey", @"Whiskey") forState:UIControlStateNormal];
    

    [self.wineButton addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.whiskeyButton addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

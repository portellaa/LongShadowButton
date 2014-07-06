//
//  LSBDViewController.m
//  LongShadowButton-Demo
//
//  Created by Luís Portela Afonso on 05/07/14.
//  Copyright (c) 2014 meligaletiko. All rights reserved.
//

#import "LSBDViewController.h"
#import "LSButton.h"
#import <QuartzCore/QuartzCore.h>

@interface LSBDViewController ()

@property (weak, nonatomic) IBOutlet LSButton *shadowButton;

@end

@implementation LSBDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	CAGradientLayer *backgroundGradient = [CAGradientLayer layer];
	backgroundGradient.frame = self.view.frame;
	backgroundGradient.colors = [NSArray arrayWithObjects:
								 (id)[UIColor blueColor].CGColor,
								 (id)[UIColor redColor].CGColor,
								 nil];
	
	backgroundGradient.masksToBounds = YES;
	
	
	[self.view.layer insertSublayer:backgroundGradient atIndex:0];
	
	self.shadowButton.gradientColors = [NSArray arrayWithObjects:
										(id)[[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor,
										(id)[[UIColor blackColor] colorWithAlphaComponent:0.1].CGColor,
										nil];
	
	self.shadowButton.layer.borderColor = [UIColor whiteColor].CGColor;
	self.shadowButton.layer.borderWidth = 2.5f;
	self.shadowButton.layer.cornerRadius = 5.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

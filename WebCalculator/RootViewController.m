//
//  ViewController.m
//  WebCalculator
//
//  Created by Gabriel Borri de Azevedo on 1/9/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNumber;
@property (weak, nonatomic) IBOutlet UITextField *secondNumber;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *webButton;

@property NSInteger result;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webButton.enabled = FALSE;
}

- (IBAction)onCalculateButtonTapped:(id)sender {
    [self.secondNumber resignFirstResponder];
    self.webButton.enabled = FALSE;
    self.result = (self.firstNumber.text.intValue * self.secondNumber.text.intValue);
    if (self.result % 5 == 0)
    {
        self.webButton.enabled = TRUE;
    }
    self.navigationItem.title = [NSString stringWithFormat:@"%ld", (long)self.result];
}
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webVC = segue.destinationViewController;
    webVC.result = self.result;
}

@end

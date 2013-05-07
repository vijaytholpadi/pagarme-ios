//
//  PagarMeViewController.m
//  PagarMe
//
//  Created by Pedro Franceschi on 5/3/13.
//  Copyright (c) 2013 PagarMe. All rights reserved.
//

#import "PagarMeViewController.h"
#import "PagarMe.h"

@interface PagarMeViewController ()

@end

@implementation PagarMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Sets your encryption key
	[[PagarMe sharedInstance] setEncryptionKey:@"9741a03ea3a4f15f6fa8d9fe9d2c47c8"];

	PagarMeCreditCard *creditCard = [[PagarMeCreditCard alloc] init];
	creditCard.cardNumber = @"4901720080344448";
	creditCard.cardHolderName = @"Test User";
	creditCard.cardExpiracyMonth = 12;
	creditCard.cardExpiracyYear = 13;
	creditCard.cardCvv = @"315";

	[creditCard generateHash:^(NSError *error, NSString *cardHash) {
		NSLog(@"GOT CARD HASH: %@", cardHash);
		NSLog(@"ERROR? %@", error);
	}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
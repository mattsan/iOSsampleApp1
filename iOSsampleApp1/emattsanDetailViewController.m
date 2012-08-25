//
//  emattsanDetailViewController.m
//  iOSsampleApp1
//
//  Created by 松本 栄二 on 2012/08/26.
//  Copyright (c) 2012年 松本 栄二. All rights reserved.
//

#import "emattsanDetailViewController.h"

@interface emattsanDetailViewController ()

@end

@implementation emattsanDetailViewController

@synthesize eventTitle;
@synthesize description;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) viewWillAppear:(BOOL)animated
{
    textView.text = eventTitle;
    [webView loadHTMLString:description baseURL:[NSURL URLWithString:@""]];
}



@end

//
//  emattsanViewController.m
//  iOSsampleApp1
//
//  Created by 松本 栄二 on 2012/08/26.
//  Copyright (c) 2012年 松本 栄二. All rights reserved.
//

#import "emattsanViewController.h"
#import "emattsanTableViewController.h"

#import "Classes/SBJson.h"

@interface emattsanViewController ()

@end

@implementation emattsanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString     *request    = [NSString stringWithFormat:@"http://connpass.com/api/v1/event/?keyword=%@&count=100", searchField.text];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[request stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    NSData       *response   = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    NSString     *result     = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSDictionary *connpass = [result JSONValue];
    
    emattsanTableViewController* table = segue.destinationViewController;
    table.eventData = connpass;
}

@end

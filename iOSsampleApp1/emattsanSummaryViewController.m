//
//  emattsanSummaryViewController.m
//  iOSsampleApp1
//
//  Created by 松本 栄二 on 2012/08/29.
//  Copyright (c) 2012年 松本 栄二. All rights reserved.
//

#import "emattsanSummaryViewController.h"
#import "emattsanDetailViewController.h"

@interface emattsanSummaryViewController ()

@end

@implementation emattsanSummaryViewController

@synthesize row;
@synthesize events;

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
    titleView.text = [[events objectAtIndex:row] objectForKey:@"title"];
    catchView.text = [[events objectAtIndex:row] objectForKey:@"catch"];
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    emattsanDetailViewController *detail = segue.destinationViewController;
    
    detail.eventTitle  = [[events objectAtIndex:row] objectForKey:@"title"];
    detail.description = [[events objectAtIndex:row] objectForKey:@"description"];
    
    NSLog(@"%@", detail.eventTitle);
}

@end

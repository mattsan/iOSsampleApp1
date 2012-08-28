//
//  emattsanViewController.m
//  iOSsampleApp1
//
//  Created by 松本 栄二 on 2012/08/26.
//  Copyright (c) 2012年 松本 栄二. All rights reserved.
//

#import "emattsanViewController.h"
#import "emattsanTableViewController.h"

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
    NSInteger      results_returned;
    NSInteger      count      = 10;
    NSInteger      eventCount = 0;
    NSMutableArray *events    = [[NSMutableArray alloc] init];
    NSUInteger     start      = 1;

    NSMutableString *keywords = [[NSMutableString alloc] init];
    [[searchField.text componentsSeparatedByString:@" "] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) { if( ! [obj isEqualToString:@""]) { [keywords appendFormat:@"&keyword=%@", obj]; } }];
    NSLog(@"keywords = %@", keywords);
    
    do
    {
        // TODO: to use sendAsynchronousRequest:queue:completionHandler:
        NSString     *request    = [NSString stringWithFormat:@"http://connpass.com/api/v1/event/?&count=%ld&start=%ld%@", (long)count, (long)start, keywords];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[request stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        NSData       *response   = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
        NSDictionary *connpass   = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:NULL];

        [[connpass objectForKey:@"results_returned"] getValue:&results_returned];
        eventCount += results_returned;
        [events addObjectsFromArray:[connpass objectForKey:@"events"]];
        start += count;
    } while (results_returned == count);

    emattsanTableViewController* table = segue.destinationViewController;
    table.events     = events;
    table.eventCount = eventCount;
}

@end

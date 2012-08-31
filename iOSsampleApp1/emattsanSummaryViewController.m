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
@synthesize titles;
@synthesize details;

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

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        // TODO: to format date and time
        // TODO: to format object when it's null
        NSString *started_at = [[events objectAtIndex:row] objectForKey:@"started_at"];
        NSString *ended_at   = [[events objectAtIndex:row] objectForKey:@"ened_at"];
        
        titles  = [NSArray arrayWithObjects:
                   [[events objectAtIndex:row] objectForKey:@"title"],
                   @"",
                   @"開催場所",
                   @"開催会場",
                   @"開催日時",
                   @"定員",
                   @"参加者数",
                   @"補欠者数",
                   nil];
        details = [NSArray arrayWithObjects:
                   @"",
                   [NSString stringWithFormat:@"%@", [[events objectAtIndex:row] objectForKey:@"catch"]],
                   [NSString stringWithFormat:@"%@", [[events objectAtIndex:row] objectForKey:@"address"]],
                   [NSString stringWithFormat:@"%@", [[events objectAtIndex:row] objectForKey:@"place"]],
                   [NSString stringWithFormat:@"%@〜%@", started_at, ended_at],
                   [NSString stringWithFormat:@"%@ 名", [[events objectAtIndex:row] objectForKey:@"limit"]],
                   [NSString stringWithFormat:@"%@ 名", [[events objectAtIndex:row] objectForKey:@"accepted"]],
                   [NSString stringWithFormat:@"%@ 名", [[events objectAtIndex:row] objectForKey:@"waiting"]],
                   nil];
        return 8;
    }
    else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        static NSString *CellIdentifier = @"Cell";

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
        
        cell.textLabel.text       = [titles objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [details objectAtIndex:indexPath.row];
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"Detail";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }

        cell.textLabel.text = @"詳細";
        
        return cell;
    }
}

@end

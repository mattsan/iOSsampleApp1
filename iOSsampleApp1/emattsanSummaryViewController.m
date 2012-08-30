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
        return 5;
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
        
        switch(indexPath.row)
        {
        case 0:
            cell.textLabel.text = [[events objectAtIndex:row] objectForKey:@"title"];
            break;

        case 1:
            cell.textLabel.text = [[events objectAtIndex:row] objectForKey:@"catch"];
            break;

        case 2:
            cell.textLabel.text       = @"定員";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[events objectAtIndex:row] objectForKey:@"limit"]];
            break;

        case 3:
            cell.textLabel.text       = @"参加者数";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[events objectAtIndex:row] objectForKey:@"accepted"]];
            break;
            
        case 4:
            cell.textLabel.text       = @"補欠者数";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[events objectAtIndex:row] objectForKey:@"waiting"]];
            break;

        default:
            break;
        }
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

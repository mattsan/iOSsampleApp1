//
//  emattsanTableViewController.h
//  iOSsampleApp1
//
//  Created by 松本 栄二 on 2012/08/26.
//  Copyright (c) 2012年 松本 栄二. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface emattsanTableViewController : UITableViewController
{
    IBOutlet UILabel *eventCountLabel;
}

@property (readwrite) NSArray    *events;
@property (readwrite) NSUInteger eventCount;

@end

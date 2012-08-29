//
//  emattsanSummaryViewController.h
//  iOSsampleApp1
//
//  Created by 松本 栄二 on 2012/08/29.
//  Copyright (c) 2012年 松本 栄二. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface emattsanSummaryViewController : UIViewController
{
    IBOutlet UITextView *titleView;
    IBOutlet UITextView *catchView;
}

@property (readwrite) NSUInteger row;
@property (readwrite) NSArray    *events;

@end

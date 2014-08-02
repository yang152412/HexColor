//
//  AppDelegate.m
//  HexColor
//
//  Created by iyaya on 14-8-1.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    MasterViewController *mainVC = [[MasterViewController alloc] initWithNibName:@"MasterViewController.nib" bundle:[NSBundle mainBundle]];
    
    self.masterViewController = mainVC;
    // 2. Add the view controller to the Window's content view
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag
{
	if (flag) {
		return NO;
	}
    else
	{
        [self.window makeKeyAndOrderFront:self];
        return YES;
	}
    
}

@end

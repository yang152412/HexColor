//
//  AppDelegate.h
//  HexColor
//
//  Created by iyaya on 14-8-1.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MasterViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,strong) IBOutlet MasterViewController *masterViewController;  


@end

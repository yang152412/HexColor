//
//  ViewController.h
//  HexColor
//
//  Created by iyaya on 14-8-1.
//  Copyright (c) 2014年 iyaya. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MasterViewController : NSViewController

@property (nonatomic,strong) IBOutlet NSTextField *hexField;
@property (nonatomic,strong) IBOutlet NSTextField *rField;
@property (nonatomic,strong) IBOutlet NSTextField *gField;
@property (nonatomic,strong) IBOutlet NSTextField *bField;

- (IBAction)toRGB:(id)sender;
- (IBAction)toHex:(id)sender;
- (IBAction)persentToHex:(id)sender;

@property (nonatomic,strong) IBOutlet NSColorWell *colorWell;
@property (nonatomic,strong) IBOutlet NSTextField *codeLabel;

@property (nonatomic,strong) IBOutlet NSTextField *rPersentField;
@property (nonatomic,strong) IBOutlet NSTextField *gPersentField;
@property (nonatomic,strong) IBOutlet NSTextField *bPersentField;

@end

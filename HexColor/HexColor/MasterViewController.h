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

- (IBAction)toRGB:(id)sender;
- (IBAction)toHex:(id)sender;
- (IBAction)persentToHex:(id)sender;

@property (nonatomic,strong) IBOutlet NSColorWell *colorWell;
@property (nonatomic,strong) IBOutlet NSTextField *codeLabel;


@property (nonatomic,strong) IBOutlet NSForm *rgbForm;
@property (nonatomic,strong) IBOutlet NSForm *rgbPersentForm;

@property (nonatomic,strong) NSString *r;
@property (nonatomic,strong) NSString *g;
@property (nonatomic,strong) NSString *b;

@property (nonatomic,strong) NSString *rPercent;
@property (nonatomic,strong) NSString *gPercent;
@property (nonatomic,strong) NSString *bPercent;

@end

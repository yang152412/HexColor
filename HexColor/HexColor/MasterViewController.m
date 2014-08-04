//
//  ViewController.m
//  HexColor
//
//  Created by iyaya on 14-8-1.
//  Copyright (c) 2014年 iyaya. All rights reserved.
//

#import "MasterViewController.h"
#import <objc/runtime.h>

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    NSFormCell *rCell = [self.rgbForm cellAtIndex:0];
    self.r = rCell.stringValue;
}
#pragma mark - setter/getter
- (NSString *)r
{
    return [[self.rgbForm cellAtIndex:0] stringValue];
}
- (void)setR:(NSString *)r
{
    [[self.rgbForm cellAtIndex:0] setStringValue:r];
}

- (NSString *)g
{
    return [[self.rgbForm cellAtIndex:1] stringValue];
}

- (void)setG:(NSString *)g
{
    [[self.rgbForm cellAtIndex:1] setStringValue:g];
}


- (NSString *)b
{
    return [[self.rgbForm cellAtIndex:2] stringValue];
}

- (void)setB:(NSString *)b
{
    [[self.rgbForm cellAtIndex:2] setStringValue:b];
}


- (NSString *)rPercent
{
    return [[self.rgbPersentForm cellAtIndex:0] stringValue];
}
- (void)setRPercent:(NSString *)rPercent
{
    [[self.rgbPersentForm cellAtIndex:0] setStringValue:rPercent];
}


- (NSString *)gPercent
{
    return [[self.rgbPersentForm cellAtIndex:1] stringValue];
}
- (void)setGPercent:(NSString *)gPercent
{
    [[self.rgbPersentForm cellAtIndex:1] setStringValue:gPercent];
}


- (NSString *)bPercent
{
    return [[self.rgbPersentForm cellAtIndex:2] stringValue];
}
- (void)setBPercent:(NSString *)bPercent
{
    [[self.rgbPersentForm cellAtIndex:2] setStringValue:bPercent];
}


#pragma mark  -
- (void)updateColorWell
{
    [self.colorWell setColor:[NSColor colorWithRed:self.rPercent.floatValue
                                             green:self.gPercent.floatValue
                                              blue:self.bPercent.floatValue
                                             alpha:1.0]];
    
    NSString *codeStr = [NSString stringWithFormat:@"[UIColor colorWithRed:%g green:%g blue:%g alpha:1.0]",self.rPercent.floatValue,self.gPercent.floatValue,self.bPercent.floatValue];
    self.codeLabel.stringValue = codeStr;
}

- (IBAction)toRGB:(id)sender
{
    NSString *hexStr = nil;
    if ([self.hexField.stringValue hasPrefix:@"0x"]) {
        hexStr = [NSString stringWithFormat:@"%6@",self.hexField.stringValue];
    } else {
        hexStr = [NSString stringWithFormat:@"0x%6@",self.hexField.stringValue];
    }
    NSArray *arr = [MasterViewController stringFromHexString:hexStr];
//
    
    
    
    self.r = [NSString stringWithFormat:@"%@",arr[0]];
    self.g = [NSString stringWithFormat:@"%@",arr[1]];
    self.b = [NSString stringWithFormat:@"%@",arr[2]];
    
    self.rPercent = [NSString stringWithFormat:@"%g",self.r.floatValue/255.0];
    self.gPercent = [NSString stringWithFormat:@"%g",self.g.floatValue/255.0];
    self.bPercent = [NSString stringWithFormat:@"%g",self.b.floatValue/255.0];
    
    [self updateColorWell];
}

- (IBAction)persentToHex:(id)sender
{
    self.r = [NSString stringWithFormat:@"%.0f",self.rPercent.floatValue*255];
    self.g = [NSString stringWithFormat:@"%.0f",self.gPercent.floatValue*255];
    self.b = [NSString stringWithFormat:@"%.0f",self.bPercent.floatValue*255];
    
    NSString *r = [NSString stringWithUTF8String:decimal_to_hex(self.r.intValue)];
    NSString *g = [NSString stringWithUTF8String:decimal_to_hex(self.g.intValue)];
    NSString *b = [NSString stringWithUTF8String:decimal_to_hex(self.b.intValue)];
    
    NSString *result = [NSString stringWithFormat:@"%2@%2@%2@",
                        [r substringFromIndex:2],
                        [g substringFromIndex:2],
                        [b substringFromIndex:2]];
    self.hexField.stringValue = result;
    
    [self updateColorWell];
}

- (IBAction)toHex:(id)sender
{
    NSString *r = [NSString stringWithUTF8String:decimal_to_hex(self.r.intValue)];
    NSString *g = [NSString stringWithUTF8String:decimal_to_hex(self.g.intValue)];
    NSString *b = [NSString stringWithUTF8String:decimal_to_hex(self.b.intValue)];
    
    NSString *result = [NSString stringWithFormat:@"%2@%2@%2@",
                        [r substringFromIndex:2],
                        [g substringFromIndex:2],
                        [b substringFromIndex:2]];
    self.hexField.stringValue = result;
    
    
    self.rPercent = [NSString stringWithFormat:@"%f",self.r.floatValue/255.0];
    self.gPercent = [NSString stringWithFormat:@"%f",self.g.floatValue/255.0];
    self.bPercent = [NSString stringWithFormat:@"%f",self.b.floatValue/255.0];
    
    [self updateColorWell];
}

char* decimal_to_hex(int n)
{
    static char buffer[32];
    sprintf(buffer, "%#.2x", n);
    return buffer;
}

// 十六进制转换为普通字符串的。
+ (NSArray *)stringFromHexString:(NSString *)hexString { //
    
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return nil;
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString length] != 6)
        return nil;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return @[@(r),@(g),@(b)];
}

@end

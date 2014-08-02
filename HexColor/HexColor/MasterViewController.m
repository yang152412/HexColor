//
//  ViewController.m
//  HexColor
//
//  Created by iyaya on 14-8-1.
//  Copyright (c) 2014年 iyaya. All rights reserved.
//

#import "MasterViewController.h"

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

- (void)updateColorWell
{
    [self.colorWell setColor:[NSColor colorWithRed:self.rPersentField.floatValue
                                             green:self.gPersentField.floatValue
                                              blue:self.bPersentField.floatValue
                                             alpha:1.0]];
    
    NSString *codeStr = [NSString stringWithFormat:@"[UIColor colorWithRed:%g green:%g blue:%g alpha:1.0]",self.rPersentField.floatValue,self.gPersentField.floatValue,self.bPersentField.floatValue];
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
    self.rField.stringValue = [NSString stringWithFormat:@"%@",arr[0]];
    self.gField.stringValue = [NSString stringWithFormat:@"%@",arr[1]];
    self.bField.stringValue = [NSString stringWithFormat:@"%@",arr[2]];
    
    self.rPersentField.stringValue = [NSString stringWithFormat:@"%g",self.rField.floatValue/255.0];
    self.gPersentField.stringValue = [NSString stringWithFormat:@"%g",self.gField.floatValue/255.0];
    self.bPersentField.stringValue = [NSString stringWithFormat:@"%g",self.bField.floatValue/255.0];
    
    [self updateColorWell];
}

- (IBAction)persentToHex:(id)sender
{
    self.rField.stringValue = [NSString stringWithFormat:@"%.0f",self.rPersentField.floatValue*255];
    self.gField.stringValue = [NSString stringWithFormat:@"%.0f",self.gPersentField.floatValue*255];
    self.bField.stringValue = [NSString stringWithFormat:@"%.0f",self.bPersentField.floatValue*255];
    
    NSString *r = [NSString stringWithUTF8String:decimal_to_hex(self.rField.intValue)];
    NSString *g = [NSString stringWithUTF8String:decimal_to_hex(self.gField.intValue)];
    NSString *b = [NSString stringWithUTF8String:decimal_to_hex(self.bField.intValue)];
    
    NSString *result = [NSString stringWithFormat:@"%2@%2@%2@",
                        [r substringFromIndex:2],
                        [g substringFromIndex:2],
                        [b substringFromIndex:2]];
    self.hexField.stringValue = result;
    
    [self updateColorWell];
}

- (IBAction)toHex:(id)sender
{
    NSString *r = [NSString stringWithUTF8String:decimal_to_hex(self.rField.intValue)];
    NSString *g = [NSString stringWithUTF8String:decimal_to_hex(self.gField.intValue)];
    NSString *b = [NSString stringWithUTF8String:decimal_to_hex(self.bField.intValue)];
    
    NSString *result = [NSString stringWithFormat:@"%2@%2@%2@",
                        [r substringFromIndex:2],
                        [g substringFromIndex:2],
                        [b substringFromIndex:2]];
    self.hexField.stringValue = result;
    
    
    self.rPersentField.stringValue = [NSString stringWithFormat:@"%f",self.rField.floatValue/255.0];
    self.gPersentField.stringValue = [NSString stringWithFormat:@"%f",self.gField.floatValue/255.0];
    self.bPersentField.stringValue = [NSString stringWithFormat:@"%f",self.bField.floatValue/255.0];
    
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

//
//  Utils.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/5/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+ (NSArray *)carregarPlist:(NSString *)plist {
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];

    return [NSArray arrayWithContentsOfFile:arquivoPlist];
}

@end

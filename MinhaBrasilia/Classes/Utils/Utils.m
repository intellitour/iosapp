//
//  Utils.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/5/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+ (NSArray *)carregarArrayPlist:(NSString *)plist {
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
    NSArray *arrayDeConteudo = [NSArray arrayWithContentsOfFile:arquivoPlist];
    return arrayDeConteudo;
}

+ (NSDictionary *)carregarDicionarioPlist:(NSString *)plist ComChave:(NSString *)chave {
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
    NSDictionary *dicionarioDeConteudo = [NSDictionary dictionaryWithContentsOfFile:arquivoPlist];
    return [dicionarioDeConteudo objectForKey:chave];
}

@end

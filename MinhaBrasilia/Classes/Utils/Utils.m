//
//  Utils.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/5/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "Utils.h"
#import "Constantes.h"

@implementation Utils


#pragma carregarArrayPlist
+ (NSArray *)carregarArrayPlist:(NSString *)plist {
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
    NSArray *arrayDeConteudo = [NSArray arrayWithContentsOfFile:arquivoPlist];
    return arrayDeConteudo;
}

#pragma carregarDicionarioPlist
+ (NSDictionary *)carregarDicionarioPlist:(NSString *)plist ComChave:(NSString *)chave {
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
    NSDictionary *dicionarioDeConteudo = [NSDictionary dictionaryWithContentsOfFile:arquivoPlist];
    return [dicionarioDeConteudo objectForKey:chave];
}

#pragma carregarPlistDeCategoriasComId
+ (NSMutableArray *)carregarPlistDeCategoriasComId:(NSString *)identificador {
    NSMutableArray *listaArquivoPlist = [[NSMutableArray alloc] init];
    NSString *caminho = [NSString stringWithFormat:@"Categoria%@", identificador];
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:caminho ofType:@"plist"];
    NSDictionary *dicionarioPlist = [NSDictionary dictionaryWithContentsOfFile:arquivoPlist];
    listaArquivoPlist = [dicionarioPlist objectForKey:@"categorias"];
    return listaArquivoPlist;
}

#pragma isStringVazia
+ (BOOL) isStringVazia:(NSString *)string {
    if([string length] == 0 || [string isKindOfClass:[NSNull class]] ||
       [string isEqualToString:@""] || [string  isEqualToString:NULL]  ||
       string == nil) {
        return YES;
    }
    return NO;
}

#pragma isEntidadeAsaNorte
+ (BOOL) isEntidadeAsaNorte:(NSString *)identificador {
    if ([identificador isEqualToString:kIdentificadorAsaNorte]) {
        return YES;
    }
    return NO;
}

#pragma isEntidadeAsaSul
+ (BOOL) isEntidadeAsaSul:(NSString *)identificador {
    if ([identificador isEqualToString:kIdentificadorAsaSul]) {
        return YES;
    }
    return NO;
}

@end

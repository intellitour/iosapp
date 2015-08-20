//
//  Utils.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/5/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (NSArray *)carregarArrayPlist:(NSString *)plist;
+ (NSDictionary *)carregarDicionarioPlist:(NSString *)plist ComChave:(NSString *)chave;
+ (BOOL) isStringVazia : (NSString *)string;
+ (NSMutableArray *)carregarPlistDeCategoriasComId:(NSString *)identificador;
+ (BOOL) isEntidadeAsaSul:(NSString *)identificador;
+ (BOOL) isEntidadeAsaNorte:(NSString *)identificador;

@end

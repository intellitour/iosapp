//
//  Loja.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "Loja.h"
#import "Categoria.h"
#import "Quadra.h"


@implementation Loja

@dynamic endereco;
@dynamic subtitulo;
@dynamic telefone;
@dynamic titulo;
@dynamic categoria;
@dynamic quadra;

+ (NSString *)nomeEntidade {
    return @"Loja";
}

+ (instancetype)inserirNovoObjetoNoContexto:(NSManagedObjectContext *)contexto {
    return [NSEntityDescription insertNewObjectForEntityForName:[self nomeEntidade]
                                         inManagedObjectContext:contexto];
}

@end

//
//  Categoria.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "Categoria.h"


@implementation Categoria

@dynamic nome;

+ (NSString *)nomeEntidade {
    return @"Categoria";
}

+ (instancetype)inserirNovoObjetoNoContexto:(NSManagedObjectContext *)contexto {
    return [NSEntityDescription insertNewObjectForEntityForName:[self nomeEntidade]
                                         inManagedObjectContext:contexto];
}


@end

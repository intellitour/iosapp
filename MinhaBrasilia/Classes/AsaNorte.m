//
//  AsaNorte.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "AsaNorte.h"
#import "Loja.h"


@implementation AsaNorte

@dynamic loja;


+ (NSString *)nomeEntidade {
    return @"AsaNorte";
}

+ (instancetype)inserirNovoObjetoNoContexto:(NSManagedObjectContext *)contexto {
    return [NSEntityDescription insertNewObjectForEntityForName:[self nomeEntidade]
                                         inManagedObjectContext:contexto];
}
@end

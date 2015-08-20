//
//  AsaSul.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "AsaSul.h"
#import "Loja.h"


@implementation AsaSul

@dynamic loja;


+ (NSString *)nomeEntidade {
    return @"AsaSul";
}

+ (instancetype)inserirNovoObjetoNoContexto:(NSManagedObjectContext *)contexto {
    return [NSEntityDescription insertNewObjectForEntityForName:[self nomeEntidade]
                                         inManagedObjectContext:contexto];
}

@end

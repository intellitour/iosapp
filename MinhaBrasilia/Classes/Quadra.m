//
//  Quadra.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "Quadra.h"


@implementation Quadra

@dynamic nome;


+ (NSString *)nomeEntidade {
    return @"Quadra";
}

+ (instancetype)inserirNovoObjetoNoContexto:(NSManagedObjectContext *)contexto {
    return [NSEntityDescription insertNewObjectForEntityForName:[self nomeEntidade]
                                         inManagedObjectContext:contexto];
}

@end

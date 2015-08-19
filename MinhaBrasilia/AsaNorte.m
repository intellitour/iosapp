//
//  AsaNorte.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "AsaNorte.h"

@implementation AsaNorte

+ (NSString *)nomeEntidada {
    return @"AsaNorte";
}

+ (instancetype)inserirObjetoNoContexto:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self nomeEntidada]
                                         inManagedObjectContext:context];
}

@end

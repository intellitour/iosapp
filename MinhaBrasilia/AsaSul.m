//
//  AsaSul.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "AsaSul.h"

@implementation AsaSul

+ (NSString *)nomeEntidada {
    return @"AsaSul";
}

+ (instancetype)inserirObjetoNoContexto:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self nomeEntidada]
                                         inManagedObjectContext:context];
}

@end

//
//  AsaNorte.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Loja.h"

@interface AsaNorte : Loja

+ (NSString *)nomeEntidada;
+ (instancetype)inserirObjetoNoContexto:(NSManagedObjectContext *)context;
@end

//
//  Categoria.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Categoria : NSManagedObject

@property (nonatomic, retain) NSString * nome;


+ (NSString *)nomeEntidade;

+ (instancetype)inserirNovoObjetoNoContexto:(NSManagedObjectContext *)contexto;

@end

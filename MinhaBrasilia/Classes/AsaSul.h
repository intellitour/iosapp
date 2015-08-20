//
//  AsaSul.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/19/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Loja;

@interface AsaSul : NSManagedObject

@property (nonatomic, retain) Loja *loja;


+ (NSString *)nomeEntidade;

+ (instancetype)inserirNovoObjetoNoContexto:(NSManagedObjectContext *)contexto;

@end

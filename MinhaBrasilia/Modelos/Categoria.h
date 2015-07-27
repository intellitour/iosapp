//
//  Categoria.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/20/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Loja;

@interface Categoria : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) Loja *lojas;

@end

//
//  Loja.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/20/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Categoria, Quadra;

@interface Loja : NSManagedObject

@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSString * subtitulo;
@property (nonatomic, retain) NSString * telefone;
@property (nonatomic, retain) NSString * endereco;
@property (nonatomic, retain) Categoria *categoria;
@property (nonatomic, retain) Quadra *quadra;

@end

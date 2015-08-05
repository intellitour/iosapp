//
//  AppDelegate.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/20/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Categoria.h"
#import "Loja.h"
#import "Quadra.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) Loja *loja;
@property (strong, nonatomic) Categoria *categoria;
@property (strong, nonatomic) Quadra *quadra;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end


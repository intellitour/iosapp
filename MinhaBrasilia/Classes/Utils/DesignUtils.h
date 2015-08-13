//
//  DesignUtils.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/12/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DesignUtils : NSObject

+ (void)customizarBotao:(UIButton *)botao CorBg:(UIColor *)corBtn CorTitulo:(UIColor *)corTitulo Round:(double)arredondamento;

+ (void)customizarNavBar:(UINavigationController *)navController
           CorBtnVoltar:(UIColor *)corBtnVoltar
              CorNavBar:(UIColor *)corNavBar
            FonteTitulo:(NSString *)fonte;


@end

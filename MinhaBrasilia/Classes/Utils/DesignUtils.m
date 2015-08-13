//
//  DesignUtils.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/12/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DesignUtils.h"

@implementation DesignUtils


/**
 Método responsável por customizar o botão
 */
+ (void)customizarBotao:(UIButton *)botao CorBg:(UIColor *)corBtn CorTitulo:(UIColor *)corTitulo Round:(double)arredondamento {
    [botao setTitleColor:corTitulo forState:UIControlStateNormal];
    [botao setBackgroundColor:corBtn];
    [botao.layer setCornerRadius:arredondamento];
}

/**
 Método responsável por customizar a navBar e o botão voltar
 */
+ (void)customizarNavBar:(UINavigationController *)navController
                 CorBtnVoltar:(UIColor *)corBtnVoltar
                    CorNavBar:(UIColor *)corNavBar
                  FonteTitulo:(NSString *)fonte {


    [navController.navigationBar setTintColor:corBtnVoltar];
    [navController.navigationBar setBarTintColor:corNavBar];

    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);

    [navController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                         [UIColor colorWithRed:245.0/255.0
                                                                         green:245.0/255.0
                                                                          blue:245.0/255.0
                                                                         alpha:1.0], NSForegroundColorAttributeName,
                                                                     shadow, NSShadowAttributeName,
                                                                     [UIFont fontWithName:fonte
                                                                                     size:21.0],
                                                         NSFontAttributeName, nil]];
}

@end

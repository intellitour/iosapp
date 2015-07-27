//
//  CelulaEstabelecimentoTableViewCell.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/18/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CelulaEstabelecimentoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewEstabelecimento;
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelTelefone;
@property (weak, nonatomic) IBOutlet UILabel *labelQuadra;
@property (weak, nonatomic) IBOutlet UILabel *labelCategoria;
- (void) preencherCelulaCom:(NSString *) nomeDaCategoria;

@end

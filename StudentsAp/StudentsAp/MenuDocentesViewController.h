//
//  MenuDocentesViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface MenuDocentesViewController : UIViewController{
    
    Usuario *buscarNombreD;
}

@property (strong,nonatomic) NSString *txtUsuarioD;

- (IBAction)btnSalir:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@end

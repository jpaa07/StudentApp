//
//  InicioSesionEstudianteViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#

@interface InicioSesionEstudianteViewController : UIViewController<UITextFieldDelegate>{
    Usuario *login;
}
@property (weak, nonatomic) IBOutlet UITextField *txtUsuarioE;
@property (weak, nonatomic) IBOutlet UITextField *txtContraseniaE;

- (IBAction)btnIngresarE:(id)sender;
- (IBAction)btnSalir:(id)sender;


@end


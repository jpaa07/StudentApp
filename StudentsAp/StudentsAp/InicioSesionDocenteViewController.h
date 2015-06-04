//
//  InicioSesionDocenteViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface InicioSesionDocenteViewController : UIViewController<UITextFieldDelegate>{
    
   Usuario *loginD;
    
}
@property (weak, nonatomic) IBOutlet UITextField *txtUsuarioD;
@property (weak, nonatomic) IBOutlet UITextField *txtContraseniaD;
- (IBAction)btnIngresarD:(id)sender;
- (IBAction)btnSalir:(id)sender;

@end

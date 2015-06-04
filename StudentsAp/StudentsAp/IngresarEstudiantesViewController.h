//
//  IngresarEstudiantesViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Usuario.h"

@interface IngresarEstudiantesViewController : UIViewController{
    Usuario * nuevoEstudiante;
}
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UITextField *txtNombre;
@property (weak, nonatomic) IBOutlet UITextField *txtEdad;
@property (weak, nonatomic) IBOutlet UITextField *txtCarrera;
@property (weak, nonatomic) IBOutlet UITextField *txtCorreo;
@property (weak, nonatomic) IBOutlet UITextField *txtCelular;
@property (weak, nonatomic) IBOutlet UITextField *txtContrasenia;


- (IBAction)btnIngresar:(id)sender;


@end

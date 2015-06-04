//
//  EditarEstudiantesViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface EditarEstudiantesViewController : UIViewController<UIAlertViewDelegate>{
    Usuario *editarEstudiante;
}
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UITextField *lblId;
@property (weak, nonatomic) IBOutlet UITextField *lblNombre;
@property (weak, nonatomic) IBOutlet UITextField *lblEdad;
@property (weak, nonatomic) IBOutlet UITextField *lblCarrera;
@property (weak, nonatomic) IBOutlet UITextField *lblCorreo;
@property (weak, nonatomic) IBOutlet UITextField *lblCelular;
@property (weak, nonatomic) IBOutlet UITextField *lblContrasenia;


- (IBAction)btnEditar:(id)sender;
- (IBAction)btnConsultar:(id)sender;

@end

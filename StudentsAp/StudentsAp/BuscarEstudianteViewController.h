//
//  BuscarEstudianteViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface BuscarEstudianteViewController : UIViewController{
    Usuario *buscarEstudiante;
}

@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblId;
@property (weak, nonatomic) IBOutlet UILabel *lblNombre;
@property (weak, nonatomic) IBOutlet UILabel *lblEdad;
@property (weak, nonatomic) IBOutlet UILabel *lblCarrera;
@property (weak, nonatomic) IBOutlet UILabel *lblCorreo;
@property (weak, nonatomic) IBOutlet UILabel *lblCelular;
@property (weak, nonatomic) IBOutlet UILabel *lblContrasenia;
- (IBAction)btnBuscar:(id)sender;



@end

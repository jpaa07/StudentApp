//
//  EliminarEstudiantesViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface EliminarEstudiantesViewController : UIViewController<UIAlertViewDelegate>{
   
    Usuario *eliminarEstudiante;
}
@property (weak, nonatomic) IBOutlet UILabel *lblstatus;
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UILabel *lblId;

@property (weak, nonatomic) IBOutlet UILabel *lblNombre;
@property (weak, nonatomic) IBOutlet UILabel *lblEdad;
@property (weak, nonatomic) IBOutlet UILabel *lblCarrera;
@property (weak, nonatomic) IBOutlet UILabel *lblCorreo;
@property (weak, nonatomic) IBOutlet UILabel *lblCelular;

- (IBAction)btnBuscar:(id)sender;
- (IBAction)btnEliminar:(id)sender;

@end

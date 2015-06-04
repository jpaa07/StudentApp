//
//  EliminarNotaViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface EliminarNotaViewController : UIViewController{
    Usuario *eliminarNota;
}
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UILabel *txtCedula;
@property (weak, nonatomic) IBOutlet UILabel *txtAsignatura;
@property (weak, nonatomic) IBOutlet UITextField *txtCodigoNota;
@property (weak, nonatomic) IBOutlet UILabel *txtNota;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
- (IBAction)btnBuscar:(id)sender;
- (IBAction)btnEliminar:(id)sender;


@end

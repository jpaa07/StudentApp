//
//  EditarNotaViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface EditarNotaViewController : UIViewController{
   
    Usuario *editarNota;
    
}
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UITextField *txtAsignatura;
@property (weak, nonatomic) IBOutlet UITextField *txtNota;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UITextField *txtCedula;
@property (weak, nonatomic) IBOutlet UITextField *txtCodigoNota;



- (IBAction)btnEditar:(id)sender;
- (IBAction)btnBuscar:(id)sender;

@end

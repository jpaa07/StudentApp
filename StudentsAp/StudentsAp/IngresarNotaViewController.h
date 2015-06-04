//
//  IngresarNotaViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface IngresarNotaViewController : UIViewController{
    Usuario *nuevaNota;
    
}
@property (weak, nonatomic) IBOutlet UITextField *txtNotaId;
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UITextField *txtAsignatura;
@property (weak, nonatomic) IBOutlet UITextField *txtNota;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;


- (IBAction)btnIngresar:(id)sender;

@end

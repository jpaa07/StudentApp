//
//  BuscarNotasViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"



@interface BuscarNotasViewController : UIViewController{
     Usuario *buscarNota;
}
@property (strong,nonatomic) NSString * UsuarioE;


@property (weak, nonatomic) IBOutlet UILabel *lblAsignatura;
@property (weak, nonatomic) IBOutlet UILabel *lblNota;

- (IBAction)btnBuscarNotas:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;


@property (weak, nonatomic) IBOutlet UITextField *txtAsignatura;

@end

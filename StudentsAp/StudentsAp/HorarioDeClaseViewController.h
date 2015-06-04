//
//  HorarioDeClaseViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface HorarioDeClaseViewController : UIViewController{
 Usuario *horario;
}

@property (strong,nonatomic) NSString * UsuarioE;
@property (weak, nonatomic) IBOutlet UILabel *lblAsignatura;
@property (weak, nonatomic) IBOutlet UILabel *lblHorario;
- (IBAction)btnHorario:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtAsignatura;

@end

//
//  HorarioDeClaseViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "HorarioDeClaseViewController.h"

@interface HorarioDeClaseViewController ()

@end

@implementation HorarioDeClaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    horario=[[Usuario alloc]init];
    self.title=@"Horario de clases";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (UIView * view in self.view.subviews) {
        [view resignFirstResponder];
    }
}


- (IBAction)btnHorario:(id)sender {
    
    horario.estId=_UsuarioE;
    horario.asiId=_txtAsignatura.text;
    
    [horario searchScheduleInDataBase];
    
    _lblAsignatura.text=horario.asiNombre;
    _lblHorario.text=horario.horario;
    
    
    if([horario.status isEqualToString:@"Asignatura no encontrada"]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Asignatura no encontrada"
                                                       delegate:self
                                              cancelButtonTitle:@"Aceptar"
                              
                                              otherButtonTitles:nil];
        
        [alert show];
        
    }

    
    
    
}
@end

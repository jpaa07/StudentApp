//
//  IngresarEstudiantesViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "IngresarEstudiantesViewController.h"

@interface IngresarEstudiantesViewController ()

@end

@implementation IngresarEstudiantesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    nuevoEstudiante=[[Usuario alloc]init];
    self.title=@"Ingresar Estudiante";
    
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


- (IBAction)btnIngresar:(id)sender {
    
    
    nuevoEstudiante.estId=_txtId.text;
    nuevoEstudiante.estNombre=_txtNombre.text;
    nuevoEstudiante.estEdad=_txtEdad.text;
    nuevoEstudiante.estCarrera=_txtCarrera.text;
    nuevoEstudiante.estCorreo=_txtCorreo.text;
    nuevoEstudiante.estCelular=_txtCelular.text;
    nuevoEstudiante.estContrasenia=_txtContrasenia.text;
    
    [nuevoEstudiante insertStudentInDataBasebyId];
    
    _status.text=nuevoEstudiante.status;
    
}
@end

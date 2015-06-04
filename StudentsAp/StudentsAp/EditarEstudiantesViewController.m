//
//  EditarEstudiantesViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "EditarEstudiantesViewController.h"

@interface EditarEstudiantesViewController ()

@end

@implementation EditarEstudiantesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Editar Estudiante";
    
    editarEstudiante=[[Usuario alloc]init];
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

- (IBAction)btnConsultar:(id)sender {
    
    editarEstudiante.estId=_txtId.text;
    
    [editarEstudiante searchStudenInDataBasebyId];
    
    _lblId.text=editarEstudiante.estId;
    _lblNombre.text=editarEstudiante.estNombre;
    _lblEdad.text=editarEstudiante.estEdad;
    _lblCarrera.text=editarEstudiante.estCarrera;
    _lblCorreo.text=editarEstudiante.estCorreo;
    _lblCelular.text=editarEstudiante.estCelular;
    _lblContrasenia.text=editarEstudiante.estContrasenia;
    _status.text=editarEstudiante.status;
    
}



- (IBAction)btnEditar:(id)sender {
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Actualizar Informacion"
                                                    message:@"Esta seguro que desea Actualizar los campos ?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancelar"
                          
                                          otherButtonTitles:@"Aceptar",nil];
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Aceptar"])
    {
        editarEstudiante.estId=_lblId.text;
        editarEstudiante.estNombre=_lblNombre.text;
        editarEstudiante.estEdad=_lblEdad.text;
        editarEstudiante.estCarrera=_lblCarrera.text;
        editarEstudiante.estCorreo=_lblCorreo.text;
        editarEstudiante.estCelular=_lblCelular.text;
        editarEstudiante.estContrasenia=_lblContrasenia.text;
        
        
        [editarEstudiante updateStudentInDataBasebyId];
       
        
        // _status.text=empleado.status;
        
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Actualizar Informacion"
                                                         message:@"Informacion Actualizada"
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                               
                                               otherButtonTitles:nil];
        
        [alert1 show];
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
        
        
        
    }
    else {
        
    }
    
}


@end

//
//  EliminarEstudiantesViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "EliminarEstudiantesViewController.h"

@interface EliminarEstudiantesViewController ()

@end

@implementation EliminarEstudiantesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    eliminarEstudiante=[[Usuario alloc]init];
    self.title=@"Eliminar Estudiante";
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


- (IBAction)btnBuscar:(id)sender {
    
    eliminarEstudiante.estId=_txtId.text;
    
    [eliminarEstudiante searchStudenInDataBasebyId];
    
    _lblId.text=eliminarEstudiante.estId;
    _lblNombre.text=eliminarEstudiante.estNombre;
    _lblEdad.text=eliminarEstudiante.estEdad;
    _lblCarrera.text=eliminarEstudiante.estCarrera;
    _lblCorreo.text=eliminarEstudiante.estCorreo;
    _lblCelular.text=eliminarEstudiante.estCelular;
    _lblstatus.text=eliminarEstudiante.status;
}

- (IBAction)btnEliminar:(id)sender {
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Eliminar empleado"
                                                    message:@"Esta seguro que desea eliminarlo ?"
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
        
        [eliminarEstudiante deleteStudentInDataBaseById];
        
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Eliminar Estudiante"
                                                         message:@"Informacion Eliminada"
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

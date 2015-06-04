//
//  BuscarEstudianteViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "BuscarEstudianteViewController.h"


@interface BuscarEstudianteViewController ()

@end

@implementation BuscarEstudianteViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   buscarEstudiante=[[Usuario alloc]init];
    self.title=@"Buscar Estudiante";
    
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
   
    buscarEstudiante.estId=_txtId.text;
    
    [buscarEstudiante searchStudenInDataBasebyId];
    
    _lblId.text=buscarEstudiante.estId;
    _lblNombre.text=buscarEstudiante.estNombre;
    _lblEdad.text=buscarEstudiante.estEdad;
    _lblCarrera.text=buscarEstudiante.estCarrera;
    _lblCorreo.text=buscarEstudiante.estCorreo;
    _lblCelular.text=buscarEstudiante.estCelular;
    _lblStatus.text=buscarEstudiante.status;
    _lblContrasenia.text=buscarEstudiante.estContrasenia;
    
   
    
      
}
@end

//
//  BuscarNotasViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "BuscarNotasViewController.h"
#import "Usuario.h"
#import "MenuEstudiantesViewController.h"

@interface BuscarNotasViewController ()

@end

@implementation BuscarNotasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    buscarNota=[[Usuario alloc]init];
    self.title=@"Buscar Notas";
    
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


- (IBAction)btnBuscarNotas:(id)sender {
    
    buscarNota.estId=_UsuarioE;
    buscarNota.asiId=_txtAsignatura.text;

    
    [buscarNota searchNoteInDataBasebyId];
    
    
    _lblAsignatura.text=buscarNota.asiNombre;
    _lblNota.text=buscarNota.nota;

    
    if([buscarNota.status isEqualToString:@"Nota no encontrada"]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Nota no encontrada"
                                                       delegate:self
                                              cancelButtonTitle:@"Aceptar"
                              
                                              otherButtonTitles:nil];
        
        [alert show];
        
    }
    

    
  
    
     
}
@end

//
//  EditarNotaViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "EditarNotaViewController.h"

@interface EditarNotaViewController ()

@end

@implementation EditarNotaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    editarNota=[[Usuario alloc]init];
    self.title=@"Editar Nota";
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
    
    editarNota.estId=_txtId.text;
    editarNota.notaId=_txtCodigoNota.text;
 
    
    [editarNota searchNotesInDataBasebyId];
    
    _txtCedula.text=editarNota.estId;
    _txtAsignatura.text=editarNota.asiNombre;
    _txtNota.text=editarNota.nota;
    _lblStatus.text=editarNota.status;
    
   
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
        
        
        editarNota.estId=_txtId.text;
        editarNota.asiId=_txtAsignatura.text;
        editarNota.nota=_txtNota.text;
        
        [editarNota updateNoteInDataBasebyId];
        
        
        
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

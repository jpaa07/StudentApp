//
//  EliminarNotaViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "EliminarNotaViewController.h"

@interface EliminarNotaViewController ()

@end

@implementation EliminarNotaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    eliminarNota=[[Usuario alloc]init];
    self.title=@"Eliminar Nota";
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
    
    eliminarNota.estId=_txtId.text;
    eliminarNota.notaId=_txtCodigoNota.text;
    
    [eliminarNota searchNotesInDataBasebyId];
    
    _txtCedula.text=eliminarNota.estId;
    _txtAsignatura.text=eliminarNota.asiNombre;
    _txtNota.text=eliminarNota.nota;
    _lblStatus.text=eliminarNota.status;
    
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
        
        
        
        [eliminarNota deleteNoteInDataBasebyId];
        
        
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

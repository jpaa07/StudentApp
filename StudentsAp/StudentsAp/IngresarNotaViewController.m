//
//  IngresarNotaViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "IngresarNotaViewController.h"

@interface IngresarNotaViewController ()

@end

@implementation IngresarNotaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    nuevaNota=[[Usuario alloc]init];
    self.title=@"Ingresar Nota";
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


- (IBAction)btnIngresar:(id)sender {
    
    
    nuevaNota.notaId=_txtNotaId.text;
    nuevaNota.estId=_txtId.text;
    nuevaNota.asiId=_txtAsignatura.text;
    nuevaNota.nota=_txtNota.text;
    
    [nuevaNota insertNoteInDataBasebyId];
    
    _lblStatus.text=nuevaNota.status;
    
    
    
    
    
   
    
    
}
@end

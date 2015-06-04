//
//  InicioSesionDocenteViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "InicioSesionDocenteViewController.h"
#import "MenuDocentesViewController.h"


@interface InicioSesionDocenteViewController ()

@end

@implementation InicioSesionDocenteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    loginD=[[Usuario alloc]init];
    _txtUsuarioD.delegate=self;
    _txtContraseniaD.delegate=self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    UINavigationController *navVC = [segue destinationViewController];
    
    ((MenuDocentesViewController*)[navVC.viewControllers firstObject]).txtUsuarioD = _txtUsuarioD.text;
    
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if([loginD.docId isEqual:_txtUsuarioD.text]&&[loginD.docContrasenia isEqual:_txtContraseniaD.text]){
        return YES;
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Usuario o contraseña erradas" delegate: self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    return NO;
    
    
    
}



- (IBAction)btnIngresarD:(id)sender {
    
    loginD.docId=_txtUsuarioD.text;
    [loginD searchTeacherInDataBasebyId];
    
    if([loginD.docId isEqual:_txtUsuarioD.text]&&[loginD.docContrasenia isEqual:_txtContraseniaD]){
        
    }
    
   
    
}


    - (IBAction)btnSalir:(id)sender {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }

@end

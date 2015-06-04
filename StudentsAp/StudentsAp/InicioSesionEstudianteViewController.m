//
//  InicioSesionEstudianteViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "InicioSesionEstudianteViewController.h"
#import "MenuEstudiantesViewController.h"
#import "Usuario.h"
#import "Sesion.h"

@interface InicioSesionEstudianteViewController ()

@end

@implementation InicioSesionEstudianteViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    login=[[Usuario alloc]init];
    _txtUsuarioE.delegate=self;
    _txtContraseniaE.delegate=self;
     
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    UINavigationController *navVC = [segue destinationViewController];
    
    ((MenuEstudiantesViewController*)[navVC.viewControllers firstObject]).txtUsuarioE = _txtUsuarioE.text;
    
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
  
    
    if([login.estId isEqual:_txtUsuarioE.text]&&[login.estContrasenia isEqual:_txtContraseniaE.text]){
        return YES;
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Usuario o contraseña erradas" delegate: self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
     [alert show];
    return NO;
}




- (IBAction)btnIngresarE:(id)sender {
    
    
    login.estId=_txtUsuarioE.text;
    
    [login searchStudenInDataBasebyId];
    
   
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

    
- (IBAction)btnSalir:(id)sender {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }

@end

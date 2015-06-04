//
//  MenuEstudiantesViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "MenuEstudiantesViewController.h"
#import "BuscarNotasViewController.h"

@interface MenuEstudiantesViewController ()

@end

@implementation MenuEstudiantesViewController

NSString *UsuarioE;

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    buscarNombre=[[Usuario alloc]init];
    buscarNombre.estId=_txtUsuarioE;
    [buscarNombre searchStudenInDataBasebyId];
    UsuarioE=_txtUsuarioE;
    _txtUsuarioE=buscarNombre.estNombre;
    
   
    
    
     _lblStatus.text = [NSString stringWithFormat:@"%@", _txtUsuarioE];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BuscarNotasViewController *notasVC = [segue destinationViewController];
      notasVC.UsuarioE = UsuarioE;
    BuscarNotasViewController *horarioVC = [segue destinationViewController];
    horarioVC.UsuarioE = UsuarioE;

}


- (IBAction)btnSalir:(id)sender {
    
        [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end

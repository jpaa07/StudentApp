//
//  MenuDocentesViewController.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "MenuDocentesViewController.h"

@interface MenuDocentesViewController ()

@end

@implementation MenuDocentesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    buscarNombreD=[[Usuario alloc]init];
    buscarNombreD.docId=_txtUsuarioD;
    [buscarNombreD searchTeacherInDataBasebyId];
    _txtUsuarioD=buscarNombreD.docNombre;
    
    _lblStatus.text = [NSString stringWithFormat:@"%@", _txtUsuarioD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSalir:(id)sender {
   
        [self dismissViewControllerAnimated:YES completion:nil];
}
@end

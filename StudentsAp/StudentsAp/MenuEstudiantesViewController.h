//
//  MenuEstudiantesViewController.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"


@interface MenuEstudiantesViewController : UIViewController<UITextFieldDelegate>{
    
       Usuario *buscarNombre;
}

@property (strong,nonatomic) NSString *txtUsuarioE;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

    



@end

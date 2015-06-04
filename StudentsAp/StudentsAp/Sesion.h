//
//  Sesion.h
//  StudentsAp
//
//  Created by centro docente de computos on 3/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"

@interface Sesion : NSObject {
   
    Usuario *login;
}

@property (strong,nonatomic)NSString *user;
@property (strong,nonatomic)NSString *pwd;

+(id)sesion;
-(BOOL)validateUserDoc:(NSString *)user andPasswordDoc:(NSString *)pwd;

-(BOOL)validateUserEst:(NSString *)user andPasswordEst:(NSString *)pwd;
@end

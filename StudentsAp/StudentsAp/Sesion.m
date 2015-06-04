//
//  Sesion.m
//  StudentsAp
//
//  Created by centro docente de computos on 3/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "Sesion.h"
#import "Usuario.h"

@implementation Sesion



-(BOOL)validateUserDoc:(NSString *)user andPasswordDoc:(NSString *)pwd{
    
        if([_user isEqual:@"70032946"]&&[_pwd isEqual:@"98765"]){
        return YES;
        
    }
    
    return NO;
    
}

    

    

-(BOOL)validateUserEst:(NSString *)user andPasswordEst:(NSString *)pwd{
    
    
    //login = [[Usuario alloc] init];
   // [login searchStudenInDataBasebyId];
    if([_user isEqual:login.estId]&&[_pwd isEqual:login.estContrasenia]){
        return YES;
        
    }
    
    return NO;
    
}


+ (id)sesion{
    Sesion *instance = [[Sesion alloc] init];
    return  instance;
}

@end

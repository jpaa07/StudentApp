//
//  Usuario.h
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface Usuario : NSObject{
    
    sqlite3 *Udb;
}
//Docentes
@property NSString *docId;
@property NSString *docNombre;
@property NSString *docContrasenia;

//Estudiante
@property NSString * estId;
@property NSString *estNombre;
@property NSString *estEdad;
@property NSString *estCarrera;
@property NSString *estCorreo;
@property NSString *estCelular;
@property NSString *estContrasenia;


//Asignatura
@property NSString * asiId;
@property NSString * asiNombre;

//Nota
@property NSString *nota;
@property NSString *notaId;
@property NSString *horario;

//status
@property NSString *status;

-(void)createDatabaseInDocuments;

-(void)insertStudentInDataBasebyId;
-(void)searchStudenInDataBasebyId;
-(void)updateStudentInDataBasebyId;
-(void)deleteStudentInDataBaseById;

-(void)insertNoteInDataBasebyId;
-(void)searchNoteInDataBasebyId;
-(void)searchNotesInDataBasebyId;
-(void)updateNoteInDataBasebyId;
-(void)deleteNoteInDataBasebyId;

-(void)searchTeacherInDataBasebyId;

-(void)searchScheduleInDataBase;



@end

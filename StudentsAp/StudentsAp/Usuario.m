//
//  Usuario.m
//  StudentsAp
//
//  Created by centro docente de computos on 1/06/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "Usuario.h"

@interface Usuario()

@property(nonatomic, strong)NSString *databasePath;
@property(nonatomic, assign) NSInteger e_Id;

@end



@implementation Usuario

-(void)searchPathDatabase{
    NSString *rutaDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)objectAtIndex:0];
    _databasePath = [[NSString alloc]initWithString:[rutaDoc stringByAppendingPathComponent:@"U.db"]];
}

//bases de datos con todas las tablas
-(void)createDatabaseInDocuments{
    [self searchPathDatabase];
    
    NSFileManager * fm = [[NSFileManager alloc]init];
    NSLog(@"%@", _databasePath);
    
    //& -> direccion en memoria
    if ([fm fileExistsAtPath:_databasePath] == NO) {
        NSLog(@"El archivo no existe");
        const char * dbpath = [_databasePath UTF8String];
        if(sqlite3_open(dbpath, &Udb)==SQLITE_OK){
            NSLog(@"El archivo fue creado");
            
            char * errMsg;
            const char * sql_stmt = "CREATE TABLE IF NOT EXISTS DOCENTE (DOC_ID INTEGER PRIMARY KEY , DOC_NOMBRE TEXT,DOC_CONTRASENIA TEXT)";
            
            
            
            if (sqlite3_exec(Udb, sql_stmt, NULL, NULL, &errMsg)==SQLITE_OK) {
                NSLog(@"Tabla creada exitosamente!!..");
            }else{
                NSLog(@"Error en crear Tabla!!..:%s", errMsg);
            }
            
            const char * sql_stmt1 = "CREATE TABLE IF NOT EXISTS ESTUDIANTE (EST_ID INTEGER PRIMARY KEY , EST_NOMBRE TEXT,EST_EDAD TEXT,EST_CARRERA TEXT,EST_CORREO TEXT,EST_CELULAR TEXT,EST_CONTRASENIA TEXT)";
            
            if (sqlite3_exec(Udb, sql_stmt1, NULL, NULL, &errMsg)==SQLITE_OK) {
                NSLog(@"Tabla creada exitosamente!!..");
            }else{
                NSLog(@"Error en crear Tabla!!..:%s", errMsg);
            }
            
            
            
            
            const char * sql_stmt3 = "CREATE TABLE IF NOT EXISTS ASIGNATURA (ASI_ID INTEGER  PRIMARY KEY AUTOINCREMENT, DOC_ID INTEGER,HORARIO TEXT,ASI_NOMBRE TEXT, CONSTRAINT FK_DOC_ID FOREIGN KEY ('DOC_ID') REFERENCES 'DOCENTE' ('DOC_ID'))";
            
            if (sqlite3_exec(Udb, sql_stmt3, NULL, NULL, &errMsg)==SQLITE_OK) {
                NSLog(@"Tabla creada exitosamente!!..");
            }else{
                NSLog(@"Error en crear Tabla!!..:%s", errMsg);
            }
            
            
            const char * sql_stmt2 = "CREATE TABLE IF NOT EXISTS NOTA (NOT_ID INTEGER PRIMARY KEY AUTOINCREMENT, EST_ID INTEGER,ASI_ID INTEGER,NOTA DOUBLE, CONSTRAINT FK_EST_ID FOREIGN KEY ('EST_ID') REFERENCES 'ESTUDIANTE' ('EST_ID'),CONSTRAINT FK_ASI_ID FOREIGN KEY ('ASI_ID') REFERENCES 'ASIGNATURA' ('ASI_ID'))";
            
            if (sqlite3_exec(Udb, sql_stmt2, NULL, NULL, &errMsg)==SQLITE_OK) {
                NSLog(@"Tabla creada exitosamente!!..");
            }else{
                NSLog(@"Error en crear Tabla!!..:%s", errMsg);
            }
            
            
            
            
            
        }else{
            NSLog(@"Error en crear la base de datos");
        }
    }else{
        NSLog(@"El archivo ya existe, no se remplazo");
    }
    
    
    
    
}


-(void)insertStudentInDataBasebyId{
    [self searchPathDatabase];
    sqlite3_stmt * query;
    const char * db= [_databasePath UTF8String];
    
    if (sqlite3_open(db, &Udb)==SQLITE_OK) {
        NSString * insert = [NSString stringWithFormat:@"INSERT INTO ESTUDIANTE (EST_ID,EST_NOMBRE,EST_EDAD,EST_CARRERA,EST_CORREO,EST_CELULAR,EST_CONTRASENIA) VALUES(\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",_estId,_estNombre,_estEdad,_estCarrera,_estCorreo,_estCelular,_estContrasenia];
        
        const char * insert_sql = [insert UTF8String];
        sqlite3_prepare_v2(Udb, insert_sql, -1, &query, NULL);
        if (sqlite3_step(query)==SQLITE_DONE) {
            _status = @"Estudiante Almacenado";
        }else{
            _status = @"Estudiante No Almacenado";
        }
        sqlite3_finalize(query);
        sqlite3_close(Udb);
    }else{
        _status= @"No se pudo abrir la base de datos";
    }
    
    
    
}


-(void)searchStudenInDataBasebyId{
    
    [self searchPathDatabase];
    const char*db = [_databasePath UTF8String];
    //hacer el query
    sqlite3_stmt * query;
    if (sqlite3_open(db, &Udb)==SQLITE_OK)
    {
        NSString * select = [NSString stringWithFormat:@"SELECT EST_ID, EST_NOMBRE ,EST_EDAD,EST_CARRERA,EST_CORREO,EST_CELULAR,EST_CONTRASENIA FROM ESTUDIANTE WHERE EST_ID = \"%@\"", _estId];
        
        
        const char * select_sql = [select UTF8String];
        
        if (sqlite3_prepare_v2(Udb, select_sql, -1, &query, NULL)==SQLITE_OK) {
            
            if (sqlite3_step(query)==SQLITE_ROW) {
                _status=@"Estudiante encontrado";
                
                _estId= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 0)];
                _estNombre=[NSString stringWithFormat:@"%s", sqlite3_column_text(query, 1)];
                _estEdad=[NSString stringWithFormat:@"%s", sqlite3_column_text(query, 2)];
                _estCarrera=[NSString stringWithFormat:@"%s", sqlite3_column_text(query, 3)];
                _estCorreo=[NSString stringWithFormat:@"%s", sqlite3_column_text(query, 4)];
                _estCelular=[NSString stringWithFormat:@"%s", sqlite3_column_text(query, 5)];
                _estContrasenia=[NSString stringWithFormat:@"%s", sqlite3_column_text(query, 6)];
                
                
                
                
            }else{
                _status=@"Estudiante no encontrado";
            }
            sqlite3_finalize(query);
        }else{
            _status=@"Error en el query";
        }
        
        sqlite3_close(Udb);
    }else{
        _status =@"No se puede abrir la base de datos";
        
        
    }
    
    
    
}


-(void)updateStudentInDataBasebyId{
  
        [self searchPathDatabase];
        sqlite3_stmt * query;
        const char *db= [_databasePath UTF8String];
        
        if(sqlite3_open(db, &Udb)==SQLITE_OK){
            NSString * update=[NSString stringWithFormat:@"UPDATE ESTUDIANTE SET EST_ID= \"%@\",EST_NOMBRE =\"%@\" ,EST_EDAD =\"%@\", EST_CARRERA =\"%@\", EST_CORREO =\"%@\",EST_CELULAR =\"%@\",EST_CONTRASENIA =\"%@\" WHERE EST_ID=\"%@\"",_estId,_estNombre,_estEdad,_estCarrera,_estCorreo,_estCelular,_estContrasenia,_estId];
            
            const char * update_sql=[update UTF8String];
            
            if(sqlite3_prepare(Udb, update_sql, -1, &query, NULL)==SQLITE_OK){
                if(sqlite3_step(query)==SQLITE_DONE){
                    _status=@"Datos Actualizados";
                }else{
                    _status=@"Datos No Actualizados";
                }
                
            }else{
                _status=@"Error en el query";
            }
            
            sqlite3_finalize(query);
            sqlite3_close(Udb);
            
        }else{
            _status = @"No se pudo abrir la base de datos";
        }
    }



-(void)deleteStudentInDataBaseById{
    
    [self searchPathDatabase];
    sqlite3_stmt * query;
    const char * db=[_databasePath UTF8String];
    if (sqlite3_open(db, &Udb)==SQLITE_OK) {
        NSString * delete =[NSString stringWithFormat:@"DELETE FROM ESTUDIANTE WHERE EST_ID = \"%@\"", _estId];
        const char * delete_sql =[delete UTF8String];
        sqlite3_prepare_v2(Udb, delete_sql, -1, &query, NULL);
        if (sqlite3_step(query)==SQLITE_DONE) {
            _status =@"Estudiante eliminado!";
        }else{
            _status =@"Estudiante no existe";
            
        }
        sqlite3_finalize(query);
        sqlite3_close(Udb);
    }else{
        _status=@"Fallo al acceder a la base de datos";
    }
    
    
}

-(void)insertNoteInDataBasebyId{
    [self searchPathDatabase];
    sqlite3_stmt * query;
    const char * db= [_databasePath UTF8String];
    
    if (sqlite3_open(db, &Udb)==SQLITE_OK) {
        NSString * insert = [NSString stringWithFormat:@"INSERT INTO NOTA (NOT_ID,EST_ID,ASI_ID,NOTA) VALUES(\"%@\",\"%@\",\"%@\",\"%@\")",_notaId,_estId,_asiId,_nota];
        
        const char * insert_sql = [insert UTF8String];
        sqlite3_prepare_v2(Udb, insert_sql, -1, &query, NULL);
        if (sqlite3_step(query)==SQLITE_DONE) {
            _status = @"Nota Almacenada";
        }else{
            _status = @"Nota no Almacenada";
        }
        sqlite3_finalize(query);
        sqlite3_close(Udb);
    }else{
        _status= @"No se pudo abrir la base de datos";
    }
    
    
    
}


-(void)searchNoteInDataBasebyId {
    
    
    [self searchPathDatabase];
    const char*db = [_databasePath UTF8String];
    //hacer el query
    sqlite3_stmt * query;
    if (sqlite3_open(db, &Udb)==SQLITE_OK)
    {
        NSString * select = [NSString stringWithFormat:@"SELECT ASI_NOMBRE, NOTA FROM ESTUDIANTE E INNER JOIN NOTA N ON E.EST_ID = N.EST_ID INNER JOIN ASIGNATURA A ON N.ASI_ID = A.ASI_ID WHERE E.EST_ID = \"%@\" AND A.ASI_ID=\"%@\"", _estId,_asiId];
        
        
        const char * select_sql = [select UTF8String];
        
        if (sqlite3_prepare_v2(Udb, select_sql, -1, &query, NULL)==SQLITE_OK) {
            
            if (sqlite3_step(query)==SQLITE_ROW) {
                _status=@"Nota encontrada";
                
                
                _asiNombre= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 0)];
                _nota= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 1)];
                
            }else{
                _status=@"Nota no encontrada";
            }
            sqlite3_finalize(query);
        }else{
            _status=@"Error en el query";
        }
        
        sqlite3_close(Udb);
    }else{
        _status =@"No se puede abrir la base de datos";
        
        
    }
    
    
    
    
    
    
}


-(void)searchNotesInDataBasebyId {
    
    
    [self searchPathDatabase];
    const char*db = [_databasePath UTF8String];
    //hacer el query
    sqlite3_stmt * query;
    if (sqlite3_open(db, &Udb)==SQLITE_OK)
    {
        NSString * select = [NSString stringWithFormat:@"SELECT ASI_NOMBRE, NOTA FROM ESTUDIANTE E INNER JOIN NOTA N ON E.EST_ID = N.EST_ID INNER JOIN ASIGNATURA A ON N.ASI_ID = A.ASI_ID WHERE E.EST_ID = \"%@\" AND N.NOT_ID=\"%@\"", _estId,_notaId];
        
        
        const char * select_sql = [select UTF8String];
        
        if (sqlite3_prepare_v2(Udb, select_sql, -1, &query, NULL)==SQLITE_OK) {
            
            if (sqlite3_step(query)==SQLITE_ROW) {
                _status=@"Nota encontrada";
                
                
                _asiNombre= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 0)];
                _nota= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 1)];
                
            }else{
                _status=@"Nota no encontrado";
            }
            sqlite3_finalize(query);
        }else{
            _status=@"Error en el query";
        }
        
        sqlite3_close(Udb);
    }else{
        _status =@"No se puede abrir la base de datos";
        
        
    }
    
    
    
    
    
    
}


-(void)updateNoteInDataBasebyId{
    
    [self searchPathDatabase];
    sqlite3_stmt * query;
    const char *db= [_databasePath UTF8String];
    
    if(sqlite3_open(db, &Udb)==SQLITE_OK){
        NSString * update=[NSString stringWithFormat:@"UPDATE NOTA SET EST_ID= \"%@\",ASI_ID =\"%@\", NOTA = \"%@\" WHERE NOT_ID =\"%@\" ",_estId,_asiId,_nota,_notaId];
        
        const char * update_sql=[update UTF8String];
        
        if(sqlite3_prepare(Udb, update_sql, -1, &query, NULL)==SQLITE_OK){
            if(sqlite3_step(query)==SQLITE_DONE){
                _status=@"Datos Actualizados";
            }else{
                _status=@"Datos No Actualizados";
            }
            
        }else{
            _status=@"Error en el query";
        }
        
        sqlite3_finalize(query);
        sqlite3_close(Udb);
        
    }else{
        _status = @"No se pudo abrir la base de datos";
    }
}





-(void)deleteNoteInDataBasebyId {
    
    [self searchPathDatabase];
    sqlite3_stmt * query;
    const char * db=[_databasePath UTF8String];
    if (sqlite3_open(db, &Udb)==SQLITE_OK) {
        NSString * delete =[NSString stringWithFormat:@"DELETE FROM NOTA WHERE EST_ID = \"%@\"", _estId];
        const char * delete_sql =[delete UTF8String];
        sqlite3_prepare_v2(Udb, delete_sql, -1, &query, NULL);
        if (sqlite3_step(query)==SQLITE_DONE) {
            _status =@"Nota eliminada!";
        }else{
            _status =@"No tiene notas";
            
        }
        sqlite3_finalize(query);
        sqlite3_close(Udb);
    }else{
        _status=@"Fallo al acceder a la base de datos";
    }
    
}


-(void)searchTeacherInDataBasebyId{
    
    
    [self searchPathDatabase];
    const char*db = [_databasePath UTF8String];
    //hacer el query
    sqlite3_stmt * query;
    if (sqlite3_open(db, &Udb)==SQLITE_OK)
    {
        NSString * select = [NSString stringWithFormat:@"SELECT DOC_ID, DOC_NOMBRE,DOC_CONTRASENIA FROM DOCENTE WHERE DOC_ID = \"%@\"", _docId];
        
        
        const char * select_sql = [select UTF8String];
        
        if (sqlite3_prepare_v2(Udb, select_sql, -1, &query, NULL)==SQLITE_OK) {
            
            if (sqlite3_step(query)==SQLITE_ROW) {
                _status=@"Nota encontrada";
                
                
                _docId= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 0)];
                _docNombre= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 1)];
                _docContrasenia= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 2)];
                
                
            }else{
                _status=@"Nota no encontrado";
            }
            sqlite3_finalize(query);
        }else{
            _status=@"Error en el query";
        }
        
        sqlite3_close(Udb);
    }else{
        _status =@"No se puede abrir la base de datos";
        
        
    }
    
    
}

-(void)searchScheduleInDataBase{
    
    [self searchPathDatabase];
    const char*db = [_databasePath UTF8String];
    //hacer el query
    sqlite3_stmt * query;
    if (sqlite3_open(db, &Udb)==SQLITE_OK)
    {
        NSString * select = [NSString stringWithFormat:@"SELECT ASI_NOMBRE, HORARIO FROM (ESTUDIANTE E INNER JOIN NOTA N  ON E.EST_ID = N.EST_ID ) INNER JOIN ASIGNATURA  A ON  N.ASI_ID = A.ASI_ID WHERE E.EST_ID = \"%@\" AND A.ASI_ID=\"%@\"" , _estId,_asiId];
        
        
        const char * select_sql = [select UTF8String];
        
        if (sqlite3_prepare_v2(Udb, select_sql, -1, &query, NULL)==SQLITE_OK) {
            
            if (sqlite3_step(query)==SQLITE_ROW) {
                _status=@"Asignatura encontrada";
                
                
                _asiNombre= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 0)];
                _horario= [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 1)];
                
                
                
            }else{
                _status=@"Asignatura no encontrada";
            }
            sqlite3_finalize(query);
        }else{
            _status=@"Error en el query";
        }
        
        sqlite3_close(Udb);
    }else{
        _status =@"No se puede abrir la base de datos";
        
        
    }
    
    
}
    


 




@end

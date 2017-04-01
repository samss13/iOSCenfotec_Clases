//
//  RealmManager.m
//  ProjectManager
//
//  Created by Sam Santamaria on 3/26/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "RealmManager.h"
#import "Proyecto.h"

@implementation RealmManager

+(RLMResults*)getAllProjects{
    RLMResults<Proyecto *> *proyectos = [Proyecto allObjects];
    
    return proyectos;
}

+(void)deleteRealmObject:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:realmObject];
    [realm commitWriteTransaction];
}

+(void)createProjectWithIdentificador:(NSString*)identificador descripcion:(NSString*)descripcion coordinadorIce:(NSString*)coordinadorIce fechaInicial:(NSDate*)fechaInicial fechaFinal:(NSDate*)fechaFinal horasEstimadas:(NSNumber*)horasEstimadas horasConsumidas:(NSNumber*)horasConsumidas horasTotales:(NSNumber*)horasTotales estado:(NSString*)estado{
    Proyecto *proyecto = [[Proyecto alloc] init];
    
    proyecto.identificador = identificador;
    proyecto.descripcionProject = descripcion;
    proyecto.coordinadorIce = coordinadorIce;
    proyecto.fechaInicial = fechaInicial;
    proyecto.fechaFinal = fechaFinal;
    proyecto.horasEstimadas = horasEstimadas;
    proyecto.horasConsumidas = horasConsumidas;
    proyecto.horasTotales = horasTotales;
    proyecto.estado = estado;
    
    [RealmManager saveRealmObject:proyecto];
}


+(void)saveRealmObject:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

+(Proyecto*)getProjectWithIdentificador:(NSString*)identificador{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identificador = %@", identificador];
    
    RLMResults<Proyecto*> *proyectos = [Proyecto objectsWithPredicate:predicate];
    
    if (proyectos.count > 0) {
        return proyectos.firstObject;
    }
    
    return nil;
}

+(void)modifyProjectWithIdentificador:(NSString*)identificador descripcion:(NSString*)descripcion coordinadorIce:(NSString*)coordinadorIce fechaInicial:(NSDate*)fechaInicial fechaFinal:(NSDate*)fechaFinal horasEstimadas:(NSNumber*)horasEstimadas horasConsumidas:(NSNumber*)horasConsumidas horasTotales:(NSNumber*)horasTotales estado:(NSString*)estado project:(Proyecto*)project{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];

    
    project.identificador = identificador;
    project.descripcionProject = descripcion;
    project.coordinadorIce = coordinadorIce;
    project.fechaInicial = fechaInicial;
    project.fechaFinal = fechaFinal;
    project.horasEstimadas = horasEstimadas;
    project.horasConsumidas = horasConsumidas;
    project.horasTotales = horasTotales;
    project.estado = estado;
    
    [realm addObject:project];
    [realm commitWriteTransaction];
}

@end

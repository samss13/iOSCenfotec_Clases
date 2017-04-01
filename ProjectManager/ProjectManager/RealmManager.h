//
//  RealmManager.h
//  ProjectManager
//
//  Created by Sam Santamaria on 3/26/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class Proyecto;

@interface RealmManager : NSObject
+(RLMResults*)getAllProjects;
+(void)deleteRealmObject:(RLMObject*)realmObject;
+(void)createProjectWithIdentificador:(NSString*)identificador descripcion:(NSString*)descripcion coordinadorIce:(NSString*)coordinadorIce fechaInicial:(NSDate*)fechaInicial fechaFinal:(NSDate*)fechaFinal horasEstimadas:(NSNumber*)horasEstimadas horasConsumidas:(NSNumber*)horasConsumidas horasTotales:(NSNumber*)horasTotales estado:(NSString*)estado;
+(Proyecto*)getProjectWithIdentificador:(NSString*)identificador;
+(void)saveOrUpdateRealmObject:(RLMObject*)realmObject;
+(void)modifyProjectWithIdentificador:(NSString*)identificador descripcion:(NSString*)descripcion coordinadorIce:(NSString*)coordinadorIce fechaInicial:(NSDate*)fechaInicial fechaFinal:(NSDate*)fechaFinal horasEstimadas:(NSNumber*)horasEstimadas horasConsumidas:(NSNumber*)horasConsumidas horasTotales:(NSNumber*)horasTotales estado:(NSString*)estado project:(Proyecto*)project;
@end

//
//  CoreData.m
//  CoreData
//
//  Created by Ivan Babich on 27.05.15.
//  Copyright (c) 2015 Ivan Babich. All rights reserved.
//

#import "CoreData.h"

@implementation CoreData
// Этот метод возвращает объект.Если объекта при запуске приложения нету,то он его создает
-(NSManagedObjectContext *) managedObjectContext {
    
    NSManagedObjectContext * context = nil;
    // Считываем делегат,который реализуется в AppDelegate
    id delegate = [[UIApplication sharedApplication]delegate];
    // Спрашиваем,если у него есть метод managedObjectContext
    if ([delegate performSelector:@selector(managedObjectContext)])  {
        // то он вернет его же
        context = [delegate managedObjectContext];
    }
    return context;
}
// В этом методе мы будем передавать наименование сущности,куда мы будем все записывать,передавать само значение - имя,будем передавать,для какого ключа - это атрибут в CoreData
-(void) saveData: (NSString *) entity_Name Value: (NSString *) name For_Key: (NSString *) key {
    // Создаем объект.В CoreData мы можем поместить только NSManagedObject,для сущности entety_Name,в рамках [self managedObjectContext]
    NSManagedObject * newName = [NSEntityDescription insertNewObjectForEntityForName:entity_Name inManagedObjectContext:[self managedObjectContext]];
    [newName setValue:name forKey:key]; // в этот объект прописываем значения для определенного ключа
    NSError * error = nil;
    if (![[self managedObjectContext] save:&error]) {
        NSLog(@"Error = %@",error);    // Если что-то не обработалось,то надо распечатать ошибку
    }
}

-(NSMutableArray *) getData: (NSString *) entityName Key: (NSString *) key {
    NSMutableArray * array = [NSMutableArray new];
    // Это класс,который реализует доступ к CoreData
    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];// Создаем запрос выборки данных
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    [requestData setEntity:entityData];
    
    NSError * error = nil;
    // Применим запрос выборки данных к контексту
    NSArray * arrayData = [[self managedObjectContext]executeFetchRequest:requestData error:&error];
    // Перебираем массив в котором содержатся объекты NSManagedObject
    for (NSManagedObject * obj in arrayData) {
        
        NSString * value = [obj valueForKey:key];
        [array addObject:value]; // Каждое это имя мы будем добавлять в массив
    }
    return array;
}

-(void) save_NSData: (NSString *) entityName Value: (NSData *) dataValue Key: (NSString *) key {
    NSManagedObject * newName = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    [newName setValue:dataValue forKey:key]; // в этот объект прописываем значения для определенного ключа
    NSError * error = nil;
    if (![[self managedObjectContext] save:&error]) {
        
        NSLog(@"Error = %@",error);    // Если что-то не обработалось,то надо распечатать ошибку
    }
}

-(NSData *) getNSData: (NSString *) entityName Key: (NSString *) key {
    NSData * data = [NSData new];
    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    [requestData setEntity:entityData];
    
    NSError * error = nil;
    NSArray * arrayData = [[self managedObjectContext]executeFetchRequest:requestData error:&error];
    // Перебираем массив в котором содержатся объекты NSManagedObject
    for (NSManagedObject * obj in arrayData) {
        
        data = [obj valueForKey:key];
    }
    return data;
}


@end

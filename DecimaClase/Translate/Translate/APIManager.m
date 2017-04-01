//
//  APIManager.m
//  Translate
//
//  Created by Cesar Brenes on 3/25/17.
//  Copyright © 2017 Veux Labs. All rights reserved.
//

#import "APIManager.h"
#import "Constants.h"
#import "AFNetworking.h"

@implementation APIManager

+(AFHTTPSessionManager*)createSessionManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:API_KEY forHTTPHeaderField:@"X-Mashape-Key"];
    return manager;
}

+(void)getLanguages{
    AFHTTPSessionManager *manager = [APIManager createSessionManager];
    NSString *urlString = [NSString stringWithFormat:@"%@languages", API_URL];
    [manager GET:urlString parameters:nil progress: ^(NSProgress * _Nonnull downloadProgress) {
        
    }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [APIManager createLanguagesAvailablesAnswer:[responseObject valueForKey:LANGUAGE_KEY]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [APIManager sendErrorFoundNotification];
    }];
}

+(void)createTranslateWithOriginalLanguages:(NSString*)originLanguage destinationLanguage:(NSString*)destinationLanguage textToTranslate:(NSString*)textToTranslate{
    
    AFHTTPSessionManager *manager = [APIManager createSessionManager];
    
    NSString *urlString = [APIManager createURLForTranslateWithOriginalLanguage:originLanguage destinationLanguage:destinationLanguage textToTranslate:textToTranslate];
    
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [APIManager sendTextTranslate:[responseObject objectForKey:TEXT_TRANSLATED_KEY]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [APIManager sendErrorFoundNotification];
    }];
}

+(void)sendTextTranslate:(NSArray*)text{
    NSString *textTranslated = text.firstObject;
    [[NSNotificationCenter defaultCenter] postNotificationName:GET_LENGUAGES_NOTIFICATION object:nil userInfo:@{TRANSLATE_RESULT_KEY:textTranslated}];
}

+(NSString*)createURLForTranslateWithOriginalLanguage:(NSString*)originLanguage destinationLanguage:(NSString*)destinationLanguage textToTranslate:(NSString*)textToTranslate{
    
    NSString *urlString = [NSString stringWithFormat:@"%@translate/%@/%@/%@", API_URL,originLanguage,destinationLanguage,textToTranslate];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    return urlString;
}

+(void)createLanguagesAvailablesAnswer:(NSDictionary*) languages{
    NSMutableArray *languagesArray = [NSMutableArray new];
    for (NSString *key in languages) {
        NSDictionary *auxDictionary = @{DIRS_KEY: key, LANGUAGE_KEY: [languages valueForKey:key]};
        [languagesArray addObject:auxDictionary];
    }
    NSDictionary *result = @{LANGUAGES_ARRAY_KEY: languagesArray};
    [[NSNotificationCenter defaultCenter] postNotificationName:GET_LENGUAGES_NOTIFICATION object:nil userInfo:result];
}

+(void)sendErrorFoundNotification{
    [[NSNotificationCenter defaultCenter] postNotificationName:ERROR_FOUND_NOTIFICATION object:nil];
}
@end

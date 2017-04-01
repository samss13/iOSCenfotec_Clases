//
//  APIManager.h
//  Translate
//
//  Created by Cesar Brenes on 3/25/17.
//  Copyright © 2017 Veux Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject
+(void)getLanguages;
+(void)createTranslateWithOriginalLanguages:(NSString*)originLanguage destinationLanguage:(NSString*)destinationLanguage textToTranslate:(NSString*)textToTranslate;
@end

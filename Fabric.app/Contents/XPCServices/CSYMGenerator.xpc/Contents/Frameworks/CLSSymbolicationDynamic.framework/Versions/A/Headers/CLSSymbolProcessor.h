//
//  CLSSymbolProcessor.h
//  CLSSymbolication
//
//  Created by Matt Massicotte on 4/6/13.
//  Copyright (c) 2013 Crashlytics. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CLSSymbolProcessorSource) {
    CLSSymbolProcessorSourceUnknown,
    CLSSymbolProcessorSourceDynamicLib,
    CLSSymbolProcessorSourceStaticLib,
    CLSSymbolProcessorSourceDyldSharedCache,
    CLSSymbolProcessorSourceDSYM
};

extern NSString* const CLSSymbolicationErrorDomain;

NS_ENUM(NSUInteger, CLSSymbolicationError) {
    CLSSymbolicationErrorNoSymbols,
    CLSSymbolicationErrorNoRanges,
    CLSSymbolicationErrorNoUUID
};

@interface CLSSymbolProcessor : NSObject

+ (void)enumerateFormattedDataVersion:(NSUInteger)version atPath:(NSString*)path withBlock:(void (^)(CLSSymbolProcessorSource source, NSString* uuid, NSString* arch, NSData* data, NSError* error))block;

+ (void)enumerateSymbolicationDataFromFile:(NSString*)path withBlock:(void (^)(CLSSymbolProcessorSource source, NSString* uuid, NSString* arch, NSArray* files, NSArray* symbols, NSArray* ranges, NSError* error))block;
+ (BOOL)enumerateSymbolsFromFile:(NSString*)path error:(NSError**)error withBlock:(void (^)(NSString* symbol))block;

+ (NSData*)formattedDataVersion:(NSUInteger)version sourceType:(CLSSymbolProcessorSource)source uuid:(NSString*)uuid arch:(NSString*)arch files:(NSArray*)files symbols:(NSArray*)symbols ranges:(NSArray*)ranges;

+ (NSString*)executablePathForInputPath:(NSString*)path;

@end

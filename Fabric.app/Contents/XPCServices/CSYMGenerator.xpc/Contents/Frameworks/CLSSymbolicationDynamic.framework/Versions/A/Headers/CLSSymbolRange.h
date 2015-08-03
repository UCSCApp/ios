//
//  CLSSymbolRange.h
//  CLSSymbolication
//
//  Created by Matt Massicotte on 4/11/13.
//  Copyright (c) 2013 Crashlytics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreSymbolication.h>

@interface CLSSymbolRange : NSObject

@property (nonatomic, assign) CSRange     range;
@property (nonatomic, assign) const char* path;
@property (nonatomic, assign) NSInteger   lineNumber;
@property (nonatomic, assign) NSInteger   symbolIndex;
@property (nonatomic, assign) NSInteger   fileIndex;

@property (nonatomic, copy, readonly) NSString* filePath;

- (NSComparisonResult)compareToAddress:(uint64_t)address;
- (BOOL)containsAddress:(uint64_t)address;

@end

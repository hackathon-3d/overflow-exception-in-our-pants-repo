//
//  PaintCalculator.h
//  SparcTest
//
//  Created by Mac Mini on 8/24/13.
//  Copyright (c) 2013 FourEyedDev. All rights reserved.
//

#import "Calculator.h"

@interface PaintCalculator : Calculator {
    
}

@property NSMutableArray *costOfBehrWPrimerForFinsihes;
@property NSMutableArray *costOfBehrNoPrimerForFinishes;
@property NSMutableArray *costOfValsparWPrimerForFinishes;
@property NSMutableArray *costOfValsparNoPrimerForFinishes;
@property NSMutableArray *costOfShermanWilliamsWPrimerForFinishes;
@property NSMutableArray *costOfShermanWilliamsNoPrimerForFinishes;

// Populate price arrays
-(void) initPriceArrays;

// Internal Calculations
-(int)gallonsNeededForWidthInFeet:(float)width LengthInFeet:(float)length AndHeightInFeet:(float)height;
-(NSMutableDictionary*)estimatePriceForNumberOfGallonsWithPrimerInPaint:(int)gallons AndFinish:(int)finish;
-(NSMutableDictionary*)estimatePriceForNumberOfGallonsWithoutPrimerInPaint:(int)gallons AndFinish:(int)finish;
-(NSMutableDictionary*)estimatePriceForNumberOfGallonsWithPrimerAndPaintSeperate:(int)gallons AndFinish:(int)finish;

// Methods for external use
-(NSMutableDictionary*)estimatedCostOfPaintingARoomOfWidthInFeet:(float)width LengthInFeet:(float)length AndHeightInFeet:(float)height WithoutPrimerAndFinish:(int)finish AddMarginOfError:(float)margin AndAccountForDarkerBase:(BOOL)darkerBase OrUnfinishedSurface:(BOOL)unfinished;
-(NSMutableDictionary*)estimatedCostOfPaintingARoomOfWidthInFeet:(float)width LengthInFeet:(float)length AndHeightInFeet:(float)height WithPrimerAndFinish:(int)finish AddMarginOfError:(float)margin AndAccountForDarkerBase:(BOOL)darkerBase OrUnfinishedSurface:(BOOL)unfinished;
-(NSMutableDictionary*)estimatedCostOfPaintingARoomOfWidthInFeet:(float)width LengthInFeet:(float)length AndHeightInFeet:(float)height WithSeperatePrimerAndFinish:(int)finish AddMarginOfError:(float)margin AndAccountForDarkerBase:(BOOL)darkerBase OrUnfinishedSurface:(BOOL)unfinished;

-(NSMutableDictionary*)estimatePriceForNumberOfGallons:(int)gallonsCalledFor  WithPrimer:(int)primer AndFinish:(int)finish;

-(NSMutableDictionary*)estimateGallonsAndCostForWidth:(float)width Height:(float)height UseOfPrimer:(int)primer ChosenFinish:(int)finish MarginOfError:(float)margin ExistenceOfADarkerBase:(BOOL)darkerBase AndOrUnfinishedSurfaces:(BOOL)unfinished;

@end

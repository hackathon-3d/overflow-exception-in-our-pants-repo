//
//  PaintCalculator.m
//  SparcTest
//
//  Created by Mac Mini on 8/24/13.
//  Copyright (c) 2013 FourEyedDev. All rights reserved.
//

#import "PaintCalculator.h"

@implementation PaintCalculator

-(id) init {
    if(self = [super init]) {
        // Hard code price arrays
        [self initPriceArrays];
    }
    return self;
}

// Populate price arrays
-(void) initPriceArrays {
    // Behr W/ Primer
    _costOfBehrWPrimerForFinsihes = [[NSMutableArray alloc] init];
    // FINISH_OPTION_FLAT
    [_costOfBehrWPrimerForFinsihes addObject:[NSNumber numberWithFloat:32.00]];
    // FINISH_OPTION_EGGSHELL
    [_costOfBehrWPrimerForFinsihes addObject:[NSNumber numberWithFloat:33.00]];
    // FINISH_OPTION_SATIN
    [_costOfBehrWPrimerForFinsihes addObject:[NSNumber numberWithFloat:34.00]];
    // FINISH_OPTION_SEMI_GLOSS
    [_costOfBehrWPrimerForFinsihes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_HIGH_GLOSS
    [_costOfBehrWPrimerForFinsihes addObject:[NSNumber numberWithFloat:35.00]];
    
    // Behr No Primer
    _costOfBehrNoPrimerForFinishes = [[NSMutableArray alloc] init];
    // FINISH_OPTION_FLAT
    [_costOfBehrNoPrimerForFinishes addObject:@"N/A"];
    // FINISH_OPTION_EGGSHELL
    [_costOfBehrNoPrimerForFinishes addObject:@"N/A"];
    // FINISH_OPTION_SATIN
    [_costOfBehrNoPrimerForFinishes addObject:@"N/A"];
    // FINISH_OPTION_SEMI_GLOSS
    [_costOfBehrNoPrimerForFinishes addObject:@"N/A"];
    // FINISH_OPTION_HIGH_GLOSS
    [_costOfBehrNoPrimerForFinishes addObject:@"N/A"];
    
    
    // Valspar W/ Primer
    _costOfValsparWPrimerForFinishes = [[NSMutableArray alloc] init];
    // FINISH_OPTION_FLAT
    [_costOfValsparWPrimerForFinishes addObject:[NSNumber numberWithFloat:25.00]];
    // FINISH_OPTION_EGGSHELL
    [_costOfValsparWPrimerForFinishes addObject:[NSNumber numberWithFloat:30.00]];
    // FINISH_OPTION_SATIN
    [_costOfValsparWPrimerForFinishes addObject:[NSNumber numberWithFloat:30.00]];
    // FINISH_OPTION_SEMI_GLOSS
    [_costOfValsparWPrimerForFinishes addObject:[NSNumber numberWithFloat:30.00]];
    // FINISH_OPTION_HIGH_GLOSS
    [_costOfValsparWPrimerForFinishes addObject:[NSNumber numberWithFloat:30.00]];
    
    // Valspar No Primer
    _costOfValsparNoPrimerForFinishes = [[NSMutableArray alloc] init];
    // FINISH_OPTION_FLAT
    [_costOfValsparNoPrimerForFinishes addObject:[NSNumber numberWithFloat:11.00]];
    // FINISH_OPTION_EGGSHELL
    [_costOfValsparNoPrimerForFinishes addObject:[NSNumber numberWithFloat:15.00]];
    // FINISH_OPTION_SATIN
    [_costOfValsparNoPrimerForFinishes addObject:[NSNumber numberWithFloat:9.00]];
    // FINISH_OPTION_SEMI_GLOSS
    [_costOfValsparNoPrimerForFinishes addObject:[NSNumber numberWithFloat:19.00]];
    // FINISH_OPTION_HIGH_GLOSS
    [_costOfValsparNoPrimerForFinishes addObject:[NSNumber numberWithFloat:30.00]];
    
    
    // Sherman Williams W/ Primer
    _costOfShermanWilliamsWPrimerForFinishes = [[NSMutableArray alloc] init];
    // FINISH_OPTION_FLAT
    [_costOfShermanWilliamsWPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_EGGSHELL
    [_costOfShermanWilliamsWPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_SATIN
    [_costOfShermanWilliamsWPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_SEMI_GLOSS
    [_costOfShermanWilliamsWPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_HIGH_GLOSS
    [_costOfShermanWilliamsWPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    
    // Sherman Williams No Primer
    _costOfShermanWilliamsNoPrimerForFinishes = [[NSMutableArray alloc] init];
    // FINISH_OPTION_FLAT
    [_costOfShermanWilliamsNoPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_EGGSHELL
    [_costOfShermanWilliamsNoPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_SATIN
    [_costOfShermanWilliamsNoPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_SEMI_GLOSS
    [_costOfShermanWilliamsNoPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
    // FINISH_OPTION_HIGH_GLOSS
    [_costOfShermanWilliamsNoPrimerForFinishes addObject:[NSNumber numberWithFloat:35.00]];
}

// Internal Calculations
// Calculate the number of gallons required to paint the given area
-(int)gallonsNeededForWidthInFeet:(float)width LengthInFeet:(float)length AndHeightInFeet:(float)height {
    // Surface Area is = 2LW + 2LH + 2WH
    return (2*length*width + 2*length*height + 2*width*height)/AVG_SQUARE_FEET_PER_GALLON;
}
// Price given gallons and finish (Primer in paint)
-(NSMutableDictionary*)estimatePriceForNumberOfGallonsWithPrimerInPaint:(int)gallons AndFinish:(int)finish {
    // Create an NSMutableDictionary in which to store our estimated prices for each brand
    NSMutableDictionary *prices = [[NSMutableDictionary alloc] init];
    // Add the number of gallons we ended up needing
    [prices setObject:[NSNumber numberWithInt:gallons] forKey:@"Gallons"];
    // Estimate price using Behr paint
    [prices setObject:[NSString stringWithFormat:@"$%.02f", ([[_costOfBehrWPrimerForFinsihes objectAtIndex:finish] floatValue] * gallons)] forKey:BEHR];
    // Estimate price using Valspar paint
    [prices setObject:[NSString stringWithFormat:@"$%.02f", ([[_costOfValsparWPrimerForFinishes objectAtIndex:finish] floatValue] * gallons)] forKey:VALSPAR];
    // Estimate price using Sherman Williams paint
    [prices setObject:[NSString stringWithFormat:@"$%.02f", ([[_costOfShermanWilliamsWPrimerForFinishes objectAtIndex:finish] floatValue] * gallons)] forKey:SHERMAN_WILLIAMS];
    // Return estimated prices
    return prices;
}
// Price given gallons and finish (No primer, just paint)
-(NSMutableDictionary*)estimatePriceForNumberOfGallonsWithoutPrimerInPaint:(int)gallons AndFinish:(int)finish {
    // Create an NSMutableDictionary in which to store our estimated prices for each brand
    NSMutableDictionary *prices = [[NSMutableDictionary alloc] init];
    // Add the number of gallons we ended up needing
    [prices setObject:[NSNumber numberWithInt:gallons] forKey:@"Gallons"];
    // Estimate price using Behr paint
    [prices setObject:@"N/A" forKey:BEHR];
    // Estimate price using Valspar paint
    [prices setObject:[NSString stringWithFormat:@"$%.02f", ([[_costOfValsparNoPrimerForFinishes objectAtIndex:finish] floatValue] * gallons)] forKey:VALSPAR];
    // Estimate price using Sherman Williams paint
    [prices setObject:[NSString stringWithFormat:@"$%.02f", ([[_costOfShermanWilliamsNoPrimerForFinishes objectAtIndex:finish] floatValue] * gallons)] forKey:SHERMAN_WILLIAMS];
    // Return estimated prices
    return prices;
}
// Price given gallons and finish (Primer and paint seperate)
-(NSMutableDictionary*)estimatePriceForNumberOfGallonsWithPrimerAndPaintSeperate:(int)gallons AndFinish:(int)finish {
    // Create an NSMutableDictionary in which to store our estimated prices for each brand
    NSMutableDictionary *prices = [[NSMutableDictionary alloc] init];
    // Add the number of gallons we ended up needing
    [prices setObject:[NSNumber numberWithInt:gallons] forKey:@"gallons"];
    // Estimate price using Behr paint
    [prices setObject:@"N/A" forKey:BEHR];
    // Estimate price using Valspar paint
    [prices setObject:[NSString stringWithFormat:@"$%.02f", ([[_costOfValsparNoPrimerForFinishes objectAtIndex:finish] floatValue] * gallons + AVG_COST_OF_PRIMER_PER_GALLON * gallons)] forKey:VALSPAR];
    // Estimate price using Sherman Williams paint
    [prices setObject:[NSString stringWithFormat:@"$%.02f", ([[_costOfShermanWilliamsNoPrimerForFinishes objectAtIndex:finish] floatValue] * gallons + AVG_COST_OF_PRIMER_PER_GALLON * gallons)] forKey:SHERMAN_WILLIAMS];
    // Return estimated prices
    return prices;
}


// Methods for external use
// Price given width, length, height, and finish (No primer, just paint)
-(NSMutableDictionary*)estimatedCostOfPaintingARoomOfWidthInFeet:(float)width LengthInFeet:(float)length AndHeightInFeet:(float)height WithoutPrimerAndFinish:(int)finish AddMarginOfError:(float)margin AndAccountForDarkerBase:(BOOL)darkerBase OrUnfinishedSurface:(BOOL)unfinished {
    // How many gallons do we need?
    int gallonsCalledFor = [self gallonsNeededForWidthInFeet:width LengthInFeet:length AndHeightInFeet:height];
    // Is the surface unfinished or covered in a darker base coat? If so it'll need 2 coats
    if(darkerBase || unfinished){
        gallonsCalledFor = 2*gallonsCalledFor;
    }
    // Add margin of error (assumed to be a decimal value up to 1.0)
    gallonsCalledFor = (1.0 + margin)*gallonsCalledFor;
    gallonsCalledFor = ceilf(gallonsCalledFor);
    // Return the estimated cost
    return [self estimatePriceForNumberOfGallonsWithoutPrimerInPaint:gallonsCalledFor AndFinish:finish];
}
// Price given width, length, height, and finish (Primer in paint)
-(NSMutableDictionary*)estimatedCostOfPaintingARoomOfWidthInFeet:(float)width LengthInFeet:(float)length AndHeightInFeet:(float)height WithPrimerAndFinish:(int)finish AddMarginOfError:(float)margin AndAccountForDarkerBase:(BOOL)darkerBase OrUnfinishedSurface:(BOOL)unfinished {
    // How many gallons do we need?
    int gallonsCalledFor = [self gallonsNeededForWidthInFeet:width LengthInFeet:length AndHeightInFeet:height];
    // Is the surface unfinished or covered in a darker base coat? If so it'll need 2 coats
    if(darkerBase || unfinished){
        gallonsCalledFor = 2*gallonsCalledFor;
    }
    // Add margin of error (assumed to be a decimal value up to 1.0)
    gallonsCalledFor = (1.0 + margin)*gallonsCalledFor;
    gallonsCalledFor = ceilf(gallonsCalledFor);
    // Return the estimated cost
    return [self estimatePriceForNumberOfGallonsWithPrimerInPaint:gallonsCalledFor AndFinish:finish];
}
// Price given width, length, height, and finish (Primer and paint seperate)
-(NSMutableDictionary*)estimatedCostOfPaintingARoomOfWidthInFeet:(float)width LengthInFeet:(float)length AndHeightInFeet:(float)height WithSeperatePrimerAndFinish:(int)finish AddMarginOfError:(float)margin AndAccountForDarkerBase:(BOOL)darkerBase OrUnfinishedSurface:(BOOL)unfinished {
    // How many gallons do we need?
    int gallonsCalledFor = [self gallonsNeededForWidthInFeet:width LengthInFeet:length AndHeightInFeet:height];
    // Is the surface unfinished or covered in a darker base coat? If so it'll need 2 coats
    // That said, we don't need extra primer so the total should be 1.5 times.
    if(darkerBase || unfinished){
        gallonsCalledFor = 1.5*gallonsCalledFor;
    }
    // Add margin of error (assumed to be a decimal value up to 1.0)
    gallonsCalledFor = (1.0 + margin)*gallonsCalledFor;
    gallonsCalledFor = ceilf(gallonsCalledFor);
    // Return the estimated cost
    return [self estimatePriceForNumberOfGallonsWithPrimerAndPaintSeperate:gallonsCalledFor AndFinish:finish];
}



-(NSMutableDictionary*)estimatePriceForNumberOfGallons:(int)gallonsCalledFor WithPrimer:(int)primer AndFinish:(int)finish {
    switch (primer) {
        case PRIMER_OPTION_NONE:
            return [self estimatePriceForNumberOfGallonsWithoutPrimerInPaint:gallonsCalledFor AndFinish:finish];
            break;
        case PRIMER_OPTION_SEPARATE:
            return [self estimatePriceForNumberOfGallonsWithPrimerAndPaintSeperate:gallonsCalledFor AndFinish:finish];
            break;
        case PRIMER_OPTION_MIXED:
            return [self estimatePriceForNumberOfGallonsWithPrimerInPaint:gallonsCalledFor AndFinish:finish];
            break;
        default:
            break;
    }
}


-(NSMutableDictionary*)estimateGallonsAndCostForWidth:(float)width Height:(float)height UseOfPrimer:(int)primer ChosenFinish:(int)finish MarginOfError:(float)margin ExistenceOfADarkerBase:(BOOL)darkerBase AndOrUnfinishedSurfaces:(BOOL)unfinished {
    // How many gallons do we need?
    int gallonsCalledFor = (width * height)/350;
    if(gallonsCalledFor < 1) {
        gallonsCalledFor = 1;
    }
    // Is the surface unfinished or covered in a darker base coat? If so it'll need 2 coats
    // That said, we don't need extra primer so the total should be 1.5 times.
    if(darkerBase || unfinished){
        gallonsCalledFor = 1.5*gallonsCalledFor;
    }
    // Add margin of error (assumed to be a decimal value up to 1.0)
    gallonsCalledFor = (1.0 + margin)*gallonsCalledFor;
    gallonsCalledFor = ceilf(gallonsCalledFor);
    return [self estimatePriceForNumberOfGallons:gallonsCalledFor WithPrimer:primer AndFinish:finish];
}

@end

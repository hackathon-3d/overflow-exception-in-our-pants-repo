//
//  Calculator.m
//  SparcTest
//
//  Created by Mac Mini on 8/24/13.
//  Copyright (c) 2013 FourEyedDev. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(id) init {
    if(self = [super init]){
        
    }
    return self;
}

-(float)lengthForNumberOfSteps:(int)steps forMale:(BOOL)isMale withShoeSize:(float)shoeSize {
    // Convert the given number of steps to feet based on gender and shoe size
    if(isMale){
        // User is male
        return steps*LENGTH_IN_FEET_PER_UNIT_SHOE_SIZE_MEN;
    } else {
        // User is female
        return steps*LENGTH_IN_FEET_PER_UNIT_SHOE_SIZE_WOMEN;
    }
}

@end

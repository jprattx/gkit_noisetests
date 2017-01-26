//
//  NoiseTestViewController.h
//  gkit_noisetests
//
//  Created by John Pratt on 1/25/17.
//  Copyright © 2017 Noctivagous. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NoiseTest.h"

@interface NoiseTestViewController : NSViewController
{
    IBOutlet NSTextField *widthTextField;
    IBOutlet NSTextField *heightTextField;
    
    IBOutlet NSTextField *frequencyTextField;
    IBOutlet NSSlider *frequencySlider;
    IBOutlet NSTextField *octaveCountTextField;
    IBOutlet NSSlider *octaveCountSlider;
    IBOutlet NSTextField *persistenceTextField;
    IBOutlet NSSlider *persistenceSlider;
    IBOutlet NSTextField *lacunarityTextField;
    IBOutlet NSSlider *lacunaritySlider;
    IBOutlet NSTextField *seedTextField;
    IBOutlet NSButton *seamlessCheckboxButton;
    
    IBOutlet NSTextField *displacementTextField;
    IBOutlet NSButton *distanceEnabledCheckboxButton;
}
@property int width; 
@property int height; 

@property float frequency; 
@property int octaveCount; 
@property float persistence; 
@property float lacunarity; 
@property float seed;
@property BOOL seamless;

@property float displacement;
@property BOOL distanceEnabled;

@property float constantNoiseValue;
@property float checkerboardSquareSize;


@end

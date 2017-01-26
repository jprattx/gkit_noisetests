//
//  NoiseTestViewController.m
//  gkit_noisetests
//
//  Created by John Pratt on 1/25/17.
//  Copyright © 2017 Noctivagous. All rights reserved.
//

#import "NoiseTestViewController.h"

@interface NoiseTestViewController ()

@end

@implementation NoiseTestViewController

@synthesize frequency; 
@synthesize octaveCount; 
@synthesize persistence; 
@synthesize lacunarity; 
@synthesize seed;
@synthesize seamless;

@synthesize displacement;
@synthesize distanceEnabled;

@synthesize constantNoiseValue;
@synthesize checkerboardSquareSize;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [(NoiseTest *)[self view] setNoiseTestViewController:self];
    
    [self setWidth:(int)NSWidth([[self view] bounds])];
    [self setHeight:(int)NSHeight([[self view] bounds])];
    
    [self setFrequency:1];
    [self setOctaveCount:6];
    [self setPersistence:0.5];
    [self setLacunarity:2.0]; 
    [self setSeed:5.0];
    [self setSeamless:NO];
    
    [self setDisplacement:1.0];
    [self setDistanceEnabled:NO];
    
    [self setConstantNoiseValue:10.0];
    [self setCheckerboardSquareSize:20.0];

    [widthTextField bind:@"value" toObject:self withKeyPath:@"width" options:nil];
    [self addObserver:[self view] forKeyPath:@"width" options:NSKeyValueObservingOptionNew context:nil];
    
    [heightTextField bind:@"value" toObject:self withKeyPath:@"height" options:nil];
    [self addObserver:[self view] forKeyPath:@"height" options:NSKeyValueObservingOptionNew context:nil];
    
  
    [frequencySlider bind:@"value" toObject:self withKeyPath:@"frequency" options:nil];
    [frequencyTextField bind:@"value" toObject:self withKeyPath:@"frequency" options:nil];
    [self addObserver:[self view] forKeyPath:@"frequency" options:NSKeyValueObservingOptionNew context:nil];
    
    [octaveCountSlider bind:@"value" toObject:self withKeyPath:@"octaveCount" options:nil];
    [octaveCountTextField bind:@"value" toObject:self withKeyPath:@"octaveCount" options:nil];
    [self addObserver:[self view] forKeyPath:@"octaveCount" options:NSKeyValueObservingOptionNew context:nil];
    
    [persistenceSlider bind:@"value" toObject:self withKeyPath:@"persistence" options:nil];
    [persistenceTextField bind:@"value" toObject:self withKeyPath:@"persistence" options:nil];
    [self addObserver:[self view] forKeyPath:@"persistence" options:NSKeyValueObservingOptionNew context:nil];
    
    [lacunaritySlider bind:@"value" toObject:self withKeyPath:@"lacunarity" options:nil];
    [lacunarityTextField bind:@"value" toObject:self withKeyPath:@"lacunarity" options:nil];
    [self addObserver:[self view] forKeyPath:@"lacunarity" options:NSKeyValueObservingOptionNew context:nil];
    
    [seedTextField bind:@"value" toObject:self withKeyPath:@"seed" options:nil];
    [self addObserver:[self view] forKeyPath:@"seed" options:NSKeyValueObservingOptionNew context:nil];

    [seamlessCheckboxButton bind:@"value" toObject:self withKeyPath:@"seamless" options:nil];
    [self addObserver:[self view] forKeyPath:@"seamless" options:NSKeyValueObservingOptionNew context:nil];
    
}

@end

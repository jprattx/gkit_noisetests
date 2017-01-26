//
//  NoiseTest.h
//  gkit_noisetests
//
//  Created by John Pratt on 1/25/17.
//  Copyright © 2017 Noctivagous. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import "NoiseTestViewController.h"
@class NoiseTestViewController;

@interface NoiseTest : NSView
{
    NoiseTestViewController *noiseTestViewController;
    
    NSString *noiseClassName;
    
    GKNoise *noise;
    GKNoiseMap *noiseMap;
    
    SKTexture *noiseTexture;
    
    NSImage *noiseImage;
    
    IBOutlet NSPopUpButton *noiseSourcePopUpButton;
}

- (void) generateImageFromNoiseAndDisplay;

-(IBAction) noiseSourceChange:(id) sender;

@property NoiseTestViewController *noiseTestViewController;
@property NSString *noiseClassName;
@property GKNoise *noise;
@property GKNoiseMap *noiseMap;
@property SKTexture *noiseTexture;

@end

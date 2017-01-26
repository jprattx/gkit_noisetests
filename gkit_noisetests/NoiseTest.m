//
//  NoiseTest.m
//  gkit_noisetests
//
//  Created by John Pratt on 1/25/17.
//  Copyright © 2017 Noctivagous. All rights reserved.
//

#import "NoiseTest.h"

@implementation NoiseTest

@synthesize noiseClassName;
@synthesize noise;
@synthesize noiseMap;
@synthesize noiseTexture;
@synthesize noiseTestViewController;

- (void) awakeFromNib
{
    
    NSDictionary *menuDict = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"GKPerlinNoiseSource", @"Perlin",
                              @"GKBillowNoiseSource", @"Billow",
                               @"GKRidgedNoiseSource", @"Ridged",
                              @"GKVoronoiNoiseSource", @"Voronoi",
                              @"GKConstantNoiseSource", @"Constant",
                               @"GKCylindersNoiseSource", @"Cylinders",
                              @"GKSpheresNoiseSource", @"Spheres",
                              @"GKCheckerboardNoiseSource", @"Checkerboard",
                              nil];
    
    [menuDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *nName = key;
        
        NSMenuItem *m = [[NSMenuItem alloc] initWithTitle:nName action:nil keyEquivalent:[NSString string]];
        [m setRepresentedObject:obj];
        
        [[noiseSourcePopUpButton menu] addItem:m];
        
    }];
    
    
 
    [self setNoiseClassName:[[noiseSourcePopUpButton selectedItem] representedObject]];
    
    [self generateImageFromNoiseAndDisplay];
    
    NSLog(@"%@",[[noiseSourcePopUpButton selectedItem] representedObject]);
}


- (void) generateImageFromNoiseAndDisplay
{
    
    //Class noiseClass = NSClassFromString([self noiseClassName]);
    NSLog(@"%@",[self noiseClassName]);
    
    id noiseSource;
    
    if([[self noiseClassName] isEqualToString:@"GKPerlinNoiseSource"])
    {
     noiseSource = [[GKPerlinNoiseSource alloc] initWithFrequency:[noiseTestViewController frequency]
                                                                                     octaveCount:[noiseTestViewController octaveCount]
 
                                                                                     persistence:[noiseTestViewController persistence] 
                                                                                      lacunarity:[noiseTestViewController lacunarity]
                                                                                            seed:[noiseTestViewController seed]];
    }
    else if([[self noiseClassName] isEqualToString:@"GKRidgedNoiseSource"])
    {
        noiseSource = [[GKRidgedNoiseSource alloc] initWithFrequency:[noiseTestViewController frequency]
                                           octaveCount:[noiseTestViewController octaveCount]
         
                
                                            lacunarity:[noiseTestViewController lacunarity]
                                                  seed:[noiseTestViewController seed]];
    }
    else if([[self noiseClassName] isEqualToString:@"GKBillowNoiseSource"])
    {
        noiseSource = [[GKBillowNoiseSource alloc] initWithFrequency:[noiseTestViewController frequency]
                                                         octaveCount:[noiseTestViewController octaveCount]
                         
                                                            persistence:[noiseTestViewController persistence] 
                       
                                                          lacunarity:[noiseTestViewController lacunarity]
                                                                seed:[noiseTestViewController seed]];
    }
    else if([[self noiseClassName] isEqualToString:@"GKVoronoiNoiseSource"])
    {
    noiseSource = [[GKVoronoiNoiseSource alloc] initWithFrequency:[noiseTestViewController frequency] 
                                       displacement:[noiseTestViewController displacement]
                                    distanceEnabled:[noiseTestViewController distanceEnabled]
                                               seed:[noiseTestViewController seed]];
        
    }
    else if([[self noiseClassName] isEqualToString:@"GKConstantNoiseSource"])
    {
        noiseSource = [[GKConstantNoiseSource alloc] initWithValue:[noiseTestViewController constantNoiseValue]];
        
    }
    else if([[self noiseClassName] isEqualToString:@"GKCylindersNoiseSource"])
    {
        noiseSource = [[GKCylindersNoiseSource alloc] initWithFrequency:[noiseTestViewController frequency]];
    }
    else if([[self noiseClassName] isEqualToString:@"GKSpheresNoiseSource"])
    {
        noiseSource = [[GKSpheresNoiseSource alloc] initWithFrequency:[noiseTestViewController frequency]];
    }
    else if([[self noiseClassName] isEqualToString:@"GKCheckerboardNoiseSource"])
    {
            noiseSource = [[GKCheckerboardNoiseSource alloc] initWithSquareSize:[noiseTestViewController checkerboardSquareSize]];
    }
    
    noise = [GKNoise noiseWithNoiseSource:noiseSource];
    
    
    noiseMap = [GKNoiseMap noiseMapWithNoise:noise size:(vector_double2){1,1} origin:(vector_double2){0,0} sampleCount:(vector_int2){(int)[noiseTestViewController width],(int)[noiseTestViewController height]} seamless:[noiseTestViewController seamless]];
    
    noiseTexture = [SKTexture textureWithNoiseMap:noiseMap];
    
    
    CGImageRef imageRef = [noiseTexture CGImage];
    
    NSSize s = NSMakeSize( CGImageGetWidth(imageRef), CGImageGetHeight(imageRef)); 
    
    noiseImage =  
    [[NSImage alloc] initWithCGImage:imageRef size:s];
    
    [self setNeedsDisplay:YES];
     
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{

    NSLog(@"observeValueForKeyPath %@",keyPath);
    if([keyPath isEqualToString:@"width"] || [keyPath isEqualToString:@"height"])
    {
        [self setFrame:NSMakeRect(0,0,(float)[noiseTestViewController width],(float)[noiseTestViewController height])];
    }
    
    [self generateImageFromNoiseAndDisplay];
}


-(IBAction) noiseSourceChange:(id) sender
{
    NSLog(@"noiseSourceChange");
    
    [self setNoiseClassName:[[[sender menu] highlightedItem] representedObject]];
    
    [self generateImageFromNoiseAndDisplay];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [noiseImage drawAtPoint:NSZeroPoint fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
}

@end

//
//  CrapAppDelegate.m
//  crap
//
//  Created by Josh Cheek on 4/27/12.
//  Copyright (c) 2012 8th Light. All rights reserved.
//

#import "CrapAppDelegate.h"

@implementation CrapAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    CGFloat W = [[NSScreen mainScreen] frame].size.width;
    CGFloat H = [[NSScreen mainScreen] frame].size.height;
    
    CGFloat UW = [imageView frame].size.width;
    CGFloat UH = [imageView frame].size.height;
    CGFloat W_HALF = W / 2;
    CGFloat UW_HALF = UW / 2;
    
    NSRect unicornRect = NSMakeRect(W / 2.0 - (UW / 2.0),
                                    H / 2.0 - (UH / 2.0),
                                    UW,
                                    UH);
    
    window = [[NSWindow alloc] initWithContentRect:unicornRect
                                                   styleMask:NSBorderlessWindowMask
                                                     backing:NSBackingStoreBuffered
                                                       defer:NO];
    
    [window setBackgroundColor:[NSColor colorWithCalibratedHue:0 saturation:0 brightness:0 alpha:0.0]];
    [window setOpaque:NO];
    [window setContentView:imageView];
    
    [window setLevel:NSFloatingWindowLevel];

//    [window makeKeyAndOrderFront:self];
//    return;
    
    for (CGFloat x = -100.0; x < W; x += 20.0) {
        NSRect unicornRect = NSMakeRect(x-UW_HALF,
                                        UH/4 - (pow(x-W_HALF, 2.0) / W_HALF),
                                        UW, UH);
        
        [window setFrame:unicornRect display:YES animate:NO];
        [window makeKeyAndOrderFront:self];
        
        continue;
        struct timespec tim, tim2;
        tim.tv_sec  = 0;
        tim.tv_nsec = 100L;
        nanosleep(&tim , &tim2);
    }
    
    [NSApp terminate:self];
    
    /*
    NSDictionary *windowResize = [NSDictionary dictionaryWithObjectsAndKeys:
                                  window, NSViewAnimationTargetKey,
                                  [NSValue valueWithRect: b], NSViewAnimationEndFrameKey,
                                  nil];
    
    NSArray *animations = [NSArray arrayWithObjects:windowResize, nil];
    NSViewAnimation *animation = [[NSViewAnimation alloc] initWithViewAnimations: animations];
    
    [animation setAnimationBlockingMode: NSAnimationBlocking];
    [animation setAnimationCurve: NSAnimationLinear];
    [animation setDuration: 2];     
    [animation startAnimation];
    */
}

@end

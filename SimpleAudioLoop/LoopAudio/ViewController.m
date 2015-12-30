//
//  ViewController.m
//  LoopAudio
//
//  Created by kostya on 12/29/15.
//  Copyright © 2015 kostya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize audioPlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //get audio file path
    
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/white+noise.m4a"];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    
    NSError *error;
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.delegate = self;
    audioPlayer.numberOfLoops = -1;
    audioPlayer.volume = 1.0;
    
    if (audioPlayer == nil)
        NSLog(@"%@", error);
    else
        [self play];

    //get background or foreground state
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pause)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(play)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];

}

- (void)viewWillAppear:(BOOL)animated {

}

- (void) play {
    [audioPlayer play];
}

- (void) pause {
    [audioPlayer pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

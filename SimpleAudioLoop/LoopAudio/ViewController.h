//
//  ViewController.h
//  LoopAudio
//
//  Created by kostya on 12/29/15.
//  Copyright © 2015 kostya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

- (void) play;
- (void) pause;

@end


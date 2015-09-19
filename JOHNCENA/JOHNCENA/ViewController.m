//
//  ViewController.m
//  JOHNCENA
//
//  Created by Yungton Yang on 9/18/15.
//  Copyright (c) 2015 Yungton Yang. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)playAudio:(id)sender {
    AVAudioPlayer *audioPlayer;
    NSString *audioPath = [[NSBundle mainBundle] pathForResource: @"JOHNCENA" ofType:@"mp3"];
    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
    [audioPlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

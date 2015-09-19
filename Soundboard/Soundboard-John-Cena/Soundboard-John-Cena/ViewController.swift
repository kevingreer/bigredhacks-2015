//
//  ViewController.swift
//  Soundboard-John-Cena
//
//  Created by Kevin Greer on 9/18/15.
//  Copyright (c) 2015 KevinGreer. All rights reserved.
//

import UIKit
import AVFoundation
import iAd

class ViewController: UIViewController {
  
  @IBOutlet weak var goButton: UIButton!
  @IBOutlet weak var backgroundView: UIImageView!
  
  var adView: ADBannerView!
  var bannerIsVisible = false

  var audioPlayer: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    goButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    goButton.layer.cornerRadius = goButton.frame.width/2
    
//    backgroundView.image = UIImage(named: "cena")
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    adView = ADBannerView(frame: CGRectMake(0, self.view.frame.size.height, 320, 50))
    adView.delegate = self
    self.view.addSubview(adView)
  }
  
  @IBAction func goPressed (sender: UIButton) {
    playSound("cena.m4a")
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  func playSound(filename: String) {
    let url = NSBundle.mainBundle().URLForResource(
      filename, withExtension: nil)
    if (url == nil) {
      print("Could not find file: \(filename)")
      return
    }
    
    var error: NSError? = nil
    do {
      audioPlayer = try AVAudioPlayer(contentsOfURL: url!)
    } catch let error1 as NSError {
      error = error1
      audioPlayer = nil
    }
    if let audioPlayer = audioPlayer {
      audioPlayer.numberOfLoops = -1
      audioPlayer.prepareToPlay()
      audioPlayer.play()
    } else {
      print("Could not create audio player: \(error!)")
      return
    }

  }
}

extension ViewController: ADBannerViewDelegate {
  func bannerViewDidLoadAd(banner: ADBannerView!) {
    if !bannerIsVisible {
      if adView.superview == nil {
        self.view.addSubview(adView)
      }
      
      UIView.beginAnimations("animateAdBannerOn", context: nil)
      banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height)
      UIView.commitAnimations()
      
      bannerIsVisible = true
    }
  }
  
  func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    print("Failed to retrieve ad")
    
    if bannerIsVisible {
      UIView.beginAnimations("animateAdBannerOff", context: nil)
      banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height)
      UIView.commitAnimations()
      bannerIsVisible = false
    }
  }
}


//
//  ViewController.swift
//  MyMusic
//
//  Created by 米田 央 on 2017/05/20.
//  Copyright © 2017年 Swift-Yoneda. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
  var cymbalPlayer = AVAudioPlayer()
  let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
  var guitarPlayer = AVAudioPlayer()
  let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
  var backmusicPlayer = AVAudioPlayer()
  
  
  @IBAction func cymbal(_ sender: Any) {
    soundPlayer(&cymbalPlayer, path: cymbalPath, count: 0)
  }

  @IBAction func guitar(_ sender: Any) {
    soundPlayer(&guitarPlayer, path: guitarPath, count: 0)
  }
  
  @IBAction func play(_ sender: Any) {
    soundPlayer(&backmusicPlayer, path: backmusicPath, count: -1)
    stopButton.isEnabled = true
  }
  
  @IBOutlet weak var stopButton: UIButton!
  
  @IBAction func stop(_ sender: Any) {
    backmusicPlayer.stop()
    stopButton.isEnabled = false;
  }
  
  fileprivate func soundPlayer(_ player:inout AVAudioPlayer,path:URL,count:Int){
    do{
      player = try AVAudioPlayer(contentsOf:path,fileTypeHint:nil)
      player.numberOfLoops = count
      player.play()
    }catch{
      print("エラーが発生しました！")
    }
  }
}


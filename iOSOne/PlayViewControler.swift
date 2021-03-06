//
//  PlayViewControler.swift
//  iOSOne
//
//  Created by Kvana Dev9 on 16/07/17.
//  Copyright © 2017 Haris. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewControler: UIViewController {
    var audioPlayer :AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
        try audioPlayer = AVAudioPlayer(contentsOf: receivedAudio.filePathUrl)
        audioPlayer?.enableRate=true
        }catch{
            
        }
    }

    override func didReceiveMemoryWarning() {
       
    
    }
    
    @IBAction func playSlow(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.rate=0.3
        audioPlayer?.currentTime=0.0
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }

    @IBAction func playSpeed(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.rate=1.5
        audioPlayer?.currentTime=0.0
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    

    @IBAction func stopPlayingAudio(_ sender: UIButton) {
        audioPlayer?.stop()

    }
}

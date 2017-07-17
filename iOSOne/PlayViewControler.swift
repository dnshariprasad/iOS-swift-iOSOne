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
    var audioPlayer :AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath=Bundle.main.path(forResource: "beberexha",ofType:"mp3")
        
        let filePathUrl=URL.init(fileURLWithPath: filePath!)
        
        try! audioPlayer = AVAudioPlayer(contentsOf: filePathUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSlow(_ sender: UIButton) {
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }

}

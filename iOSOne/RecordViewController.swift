//
//  RecordViewController.swift
//  iOSOne
//
//  Created by Kvana Dev9 on 16/07/17.
//  Copyright © 2017 Haris. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController,AVAudioRecorderDelegate {
    
    var audioRecorder:AVAudioRecorder!

    @IBOutlet weak var recordLable: UILabel!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()

           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordButton(_ sender: UIButton) {
        stopButton.isHidden=false
        recordLable.text="Recording.."

    
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }

    @IBAction func stopRecording(_ sender: UIButton) {
        stopButton.isHidden=false
        recordLable.text="Tap to Record"
        audioRecorder.stop()
        let audioSession=AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag){
         recordedAudio=RecordedAudio()
         recordedAudio.filePathUrl=recorder.url
         recordedAudio.title=recorder.url.lastPathComponent
         self.performSegue(withIdentifier: "stopRecording", sender: recordedAudio)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="stopRecording"){
            let playSoundVC:PlayViewControler=segue.destination as! PlayViewControler
            let data=sender as! RecordedAudio
            playSoundVC.receivedAudio=data
        }
    }
}


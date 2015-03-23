//
//  PlaySoundViewController.swift
//  Pitch Perfect
//
//  Created by Habib, Ahsan on 3/15/15.
//  Copyright (c) 2015 Habib, Ahsan. All rights reserved.
//


import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    let pitchEffect: AVAudioUnitTimePitch = AVAudioUnitTimePitch()
    
    let audioEngine: AVAudioEngine = AVAudioEngine()

    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true

        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playFastSound(sender: UIButton) {
    
        audioPlayer.stop()
        
        audioEngine.stop()
        audioEngine.reset()

        
        audioPlayer.rate = 2.0
        audioPlayer.play()
       

    }
    
    @IBAction func stopAllSound(sender: UIButton) {
        audioPlayer.stop()
    }
    
    @IBAction func playSoundswithChipmunkFIlter(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    @IBAction func playSoundsWithDarthvaderFilter(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    @IBAction func playSlowSound(sender: UIButton) {
        audioPlayer.stop()
        
        audioEngine.stop()
        audioEngine.reset()

        
        audioPlayer.rate = 0.5
        audioPlayer.play()
        
    }
}

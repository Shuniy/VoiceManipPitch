//
//  PlaySoundsViewController.swift
//  VoiceManipulator
//
//  Created by Shubham Kumar on 28/01/23.
//

import SwiftUI
import AVFAudio

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    enum ButtonType: Int {
        case slow = 0
        case fast = 1
        case chipmunk = 2
        case vader = 3
        case echo = 4
        case reverb = 5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch ButtonType(rawValue: sender.tag) {
        case .slow:
            playSound(rate: 0)
        case .fast:
            playSound(rate: 2)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        case .none:
            playSound()
        }
        self.configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        self.stopAudio()
        self.configureUI(.notPlaying)
    }
}

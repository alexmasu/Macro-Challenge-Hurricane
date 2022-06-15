//
//  Audio.swift
//  HelBreak
//
//  Created by Giovanni Teresi on 05/04/22.
//


import Foundation
import AVFoundation

/**
 * Audio player that uses AVFoundation to play looping background music and
 * short sound effects. For when using SKActions just isn't good enough.
 */
public class SKTAudio {
    
    public var backgroundMusicPlayer: AVAudioPlayer?
    public var nya: AVAudioPlayer?
    public var miao: AVAudioPlayer?
    public var uwu: AVAudioPlayer?
    public var ora_ora: AVAudioPlayer?
    public var muda : AVAudioPlayer?
    public var harambe : AVAudioPlayer?
    public var sun : AVAudioPlayer?
    public var menz : AVAudioPlayer?
    public var king : AVAudioPlayer?


    public var soundEffectPlayer: AVAudioPlayer?
    
    public var slide_url = Bundle.main.url(forResource: "Slide", withExtension: "mp3")
    public var jump_url = Bundle.main.url(forResource: "Jump", withExtension: "mp3")
    public var crack_url = Bundle.main.url(forResource: "Crack", withExtension: "mp3")
    public var death_url = Bundle.main.url(forResource: "Death", withExtension: "mp3")
    
    public class func sharedInstance() -> SKTAudio {
        return SKTAudioInstance
    }
    
    public func playBackgroundMusic(_ filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: "mp3")
        if (url == nil) {
            print("Could not find file: \(filename)")
            return
        }
        
        var error: NSError? = nil
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url!)
        } catch let error1 as NSError {
            error = error1
            backgroundMusicPlayer = nil
        }
        if let player = backgroundMusicPlayer {
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
        } else {
            print("Could not create audio player: \(error!)")
        }
    }
    
//    public func checkFinish () -> Bool{
//        if (soundEffectPlayer != nil) {
//            return soundEffectPlayer!.isPlaying
//        }
//    }
    
    public func pauseBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            if player.isPlaying {
                player.pause()
            }
        }
    }
    
    public func resumeBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            if !player.isPlaying {
                player.play()
            }
        }
    }
    
    public func playSoundEffect(_ filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: "wav")
        if (url == nil) {
            print("Could not find file: \(filename)")
            return
        }
        
        var error: NSError? = nil
        do {
            soundEffectPlayer = try AVAudioPlayer(contentsOf: url!)
        } catch let error1 as NSError {
            error = error1
            soundEffectPlayer = nil
        }
        if let player = soundEffectPlayer {
            player.numberOfLoops = 0
            player.prepareToPlay()
            player.play()
        } else {
            print("Could not create audio player: \(error!)")
        }
    }
    
//    public func prepareSoundEffect() {
//        
//        var error: NSError? = nil
//        
//        if (SKTAudio.sharedInstance().slide_url == nil) {
//            print("Could not find file")
//            return
//        }
//        
//        do {
//            SKTAudio.sharedInstance().slide = try AVAudioPlayer(contentsOf: SKTAudio.sharedInstance().slide_url!)
//        } catch let error1 as NSError {
//            error = error1
//            SKTAudio.sharedInstance().slide = nil
//        }
//        
//        if let slide_player = SKTAudio.sharedInstance().slide {
//            slide_player.numberOfLoops = 0
//            slide_player.prepareToPlay()
//        } else {
//            print("Could not create audio player: \(error!)")
//        }
//        
//        
//        
//        if (SKTAudio.sharedInstance().crack_url == nil) {
//            print("Could not find file")
//            return
//        }
//        
//        do {
//            SKTAudio.sharedInstance().crack = try AVAudioPlayer(contentsOf: SKTAudio.sharedInstance().crack_url!)
//        } catch let error2 as NSError {
//            error = error2
//            SKTAudio.sharedInstance().crack = nil
//        }
//        
//        if let crack_player = SKTAudio.sharedInstance().crack {
//            crack_player.numberOfLoops = 0
//            crack_player.prepareToPlay()
//        } else {
//            print("Could not create audio player: \(error!)")
//        }
//        
//        
//        
//        
//        if (SKTAudio.sharedInstance().jump_url == nil) {
//            print("Could not find file")
//            return
//        }
//        
//        do {
//            SKTAudio.sharedInstance().jump = try AVAudioPlayer(contentsOf: SKTAudio.sharedInstance().jump_url!)
//        } catch let error3 as NSError {
//            error = error3
//            SKTAudio.sharedInstance().jump = nil
//        }
//        
//        if let jump_player = SKTAudio.sharedInstance().jump {
//            jump_player.numberOfLoops = 0
//            jump_player.prepareToPlay()
//        } else {
//            print("Could not create audio player: \(error!)")
//        }
//        
//        
//        if (SKTAudio.sharedInstance().death_url == nil) {
//            print("Could not find file")
//            return
//        }
//        
//        do {
//            SKTAudio.sharedInstance().death = try AVAudioPlayer(contentsOf: SKTAudio.sharedInstance().death_url!)
//        } catch let error4 as NSError {
//            error = error4
//            SKTAudio.sharedInstance().death = nil
//        }
//        
//        if let death_player = SKTAudio.sharedInstance().death {
//            death_player.numberOfLoops = 0
//            death_player.prepareToPlay()
//        } else {
//            print("Could not create audio player: \(error!)")
//        }
//    }
    
}



private let SKTAudioInstance = SKTAudio()

//
//  ViewController.swift
//  TableViewjerd
//
//  Created by yuki yamamoto on H29/01/28.
//  Copyright © 平成29年 yuki yamamoto. All rights reserved.
//
import Foundation
import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {

    var queue = AVQueuePlayer()
    var items = [AVPlayerItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let asset1 = AVPlayerItem(url: url1)
        let asset2 = AVPlayerItem(url: url2)
        let asset3 = AVPlayerItem(url: url3)
        let asset4 = AVPlayerItem(url: url4)
        
        items = [asset1, asset2, asset3, asset4]
        
        queue = AVQueuePlayer(items: items)
        for item in queue.items() {
            NotificationCenter.default.addObserver(self, selector:#selector(playerItemDidReachEnd(notification:)),name: .AVPlayerItemDidPlayToEndTime, object: item)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let music1 = Bundle.main.bundleURL.appendingPathComponent("なんか音.mp3")
    let music2 = Bundle.main.bundleURL.appendingPathComponent("もう三日.mp3")
    let music3 = Bundle.main.bundleURL.appendingPathComponent("気のせいだよ.mp3")
    let music4 = Bundle.main.bundleURL.appendingPathComponent("ビシバシ教える.mp3")
    
    
    
    let url1 = Bundle.main.bundleURL.appendingPathComponent("なんか音.mp3")
    let url2 = Bundle.main.bundleURL.appendingPathComponent("もう三日.mp3")
    let url3 = Bundle.main.bundleURL.appendingPathComponent("気のせいだよ.mp3")
    let url4 = Bundle.main.bundleURL.appendingPathComponent("ビシバシ教える.mp3")
    
    @IBOutlet weak var yourButton1: CustomButton!
    
    @IBOutlet weak var yourButton2: CustomButton!
    
    @IBOutlet weak var yourButton3: CustomButton!
    
    @IBOutlet weak var yourButton4: CustomButton!
    
    
    
    fileprivate var lonelyPlayer:AVAudioPlayer?
    var currentPlayer: Int = 0
    
    
    
    @IBAction func pushButton1(_ sender: UIButton) {
        sender.isSelected = true
        queue.play()
    }
    
    @IBAction func pushButton2(sender: UIButton) {
        if self.lonelyPlayer == nil {
            
        }else {
            if (self.lonelyPlayer?.isPlaying)! {
                self.lonelyPlayer?.stop()
            }
        }
        audioPlayer(url: url1, buttonId: 1)    }
    
    @IBAction func pushButton3(sender: UIButton) {
        if self.lonelyPlayer == nil {
            
        }else {
            if (self.lonelyPlayer?.isPlaying)! {
                self.lonelyPlayer?.stop()
            }
        }
        audioPlayer(url: url2, buttonId: 2)
    }
    
    
    @IBAction func pushButton4(_ sender: UIButton) {
        if self.lonelyPlayer == nil {
            
        }else {
            if (self.lonelyPlayer?.isPlaying)! {
                self.lonelyPlayer?.stop()
            }
        }
        audioPlayer(url: url3, buttonId: 3)
    }
    
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if (self.currentPlayer == 1) {
            yourButton2.isSelected = false
        } else if (self.currentPlayer == 2) {
            yourButton3.isSelected = false
        } else if (self.currentPlayer == 3) {
            yourButton4.isSelected = false
        }
    }
    
    
    func playerItemDidReachEnd(notification: NSNotification) {
        
        if notification.object as? AVPlayerItem == items[0] {
            yourButton1.isSelected = false
            yourButton2.isSelected = true
        }
        
        if notification.object as? AVPlayerItem == items[1] {
            yourButton2.isSelected = false
            yourButton3.isSelected = true
        }
        
        if notification.object as? AVPlayerItem == items[2] {
            yourButton3.isSelected = false
            yourButton4.isSelected = true
        }
        
        if notification.object as? AVPlayerItem == items[3] {
            yourButton4.isSelected = false
            print("item 3")
        }
        
        //        if let theQueue = notification.object  {
        //
        //        }
        //        yourButton1.isSelected = false
        //        print("hello there")
    }
    
    
    func audioPlayer(url: URL, buttonId: Int) {
        do {
            try lonelyPlayer = AVAudioPlayer(contentsOf:url)
            lonelyPlayer!.play()
            lonelyPlayer!.delegate = self
            yourButton2.isSelected = (buttonId == 1)
            yourButton3.isSelected = (buttonId == 2)
            yourButton4.isSelected = (buttonId == 3)
            currentPlayer = buttonId
        } catch {
            print(error)
        }
    }
    
}






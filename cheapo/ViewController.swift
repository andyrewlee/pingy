//
//  ViewController.swift
//  cheapo
//
//  Created by Jae Hoon Lee on 8/20/15.
//  Copyright © 2015 Jae Hoon Lee. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var urlOne: NSTextField!
    @IBOutlet weak var urlTwo: NSTextField!
    @IBOutlet weak var urlThree: NSTextField!
    @IBOutlet weak var urlFour: NSTextField!
    @IBOutlet weak var urlFive: NSTextField!
    
    @IBOutlet weak var secondInterval: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func pingButtonPressed(sender: NSButton) {
        timer.invalidate()
        
        let interval = Double(secondInterval.stringValue)
        
        if let timeInterval = interval {
            timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(timeInterval), target: self, selector: "ping", userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stopButtonPressed(sender: NSButton) {
        timer.invalidate()
        let urls = [urlOne, urlTwo, urlThree, urlFour, urlFive]

        for url in urls {
            url.textColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 1.0)
        }
    }
    
    var timer = NSTimer()
    
    func ping() {
        let urls = [urlOne, urlTwo, urlThree, urlFour, urlFive]

        for url in urls {
            if url.stringValue != "" {
                if let urlToReq = NSURL(string: url.stringValue) {
                    url.textColor = NSColor(calibratedRed: 255, green: 0, blue: 0, alpha: 1.0)

                    let data = NSData(contentsOfURL: urlToReq)
                    print("Pinged with data \(data)")
                }
            }
        }
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


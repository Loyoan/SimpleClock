//
//  ViewController.swift
//  SimpleClock
//
//  Created by 韩承钢 on 2017/8/13.
//  Copyright © 2017年 X studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer : Timer?
    var n : Int = 0
    var label_show = UILabel(frame: CGRect(x: 0, y: 0, width: swidth, height: sheigh/2))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button_start = UIButton(frame: CGRect(x: 0, y: sheigh/2, width: swidth/2, height: sheigh/2))
        let button_stop = UIButton(frame: CGRect(x: swidth/2, y: sheigh/2, width: swidth/2, height: sheigh/2))
        
        label_show.textAlignment = .center
        label_show.font = UIFont.systemFont(ofSize: 32)
        label_show.text = "CLOCK!"
        label_show.backgroundColor = .blue
        
        
        button_start.titleLabel?.font = .systemFont(ofSize: 48)
        button_start.setTitle("START", for: .normal)
        button_start.setTitle("STOP", for: .selected)
        button_start.backgroundColor = .green
        button_start.tag = 1
        button_start.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
        
        button_stop.titleLabel?.font = .systemFont(ofSize: 48)
        button_stop.setTitle("PAUSE", for: .normal)
        button_stop.setTitle("CONTINUE", for: .selected)
        button_stop.backgroundColor = .red
        button_stop.tag = 2
        button_stop.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
        
        
        self.view.addSubview(label_show)
        self.view.addSubview(button_start)
        self.view.addSubview(button_stop)
        
        
    }
    
    func buttonClicked(sender : UIButton) {
        let button = self.view.viewWithTag(sender.tag) as! UIButton
        button.isSelected = !button.isSelected
        switch sender.tag {
        case 1:
            print("START/STOP")
            button.isSelected ? start() : stop()
            
        default:
            print("PAUSE/CONTINUE")
            button.isSelected ? pause() : continuec()
        }
    }
    
    func start() {
        label_show.text = "0"
        n = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (Timer) -> () in
            self.n += 1
            self.label_show.text = "\(self.n)"
        }
    }
    
    func stop() {
        
        n = 0
        label_show.text = "0"
        timer?.invalidate()
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    func continuec()  {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (Timer) -> () in
            self.n += 1
            self.label_show.text = "\(self.n)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


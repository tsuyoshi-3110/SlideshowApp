//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 斉藤　剛 on 2020/06/29.
//  Copyright © 2020 tsuyoshi.saito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named:"1")
        imageView.image = image
    }
    var timer: Timer!
    var imagedisplayNO = 0
    var imagenameArray = ["1","2","3","4","5"]

    func imagedisp(){
        let name = imagenameArray[imagedisplayNO]
        let image = UIImage(named: name)
        imageView.image = image
    }
    @IBAction func nextButtonTap(_ sender: Any) {
        if imagedisplayNO < imagenameArray.count - 1{
            imagedisplayNO += 1
            imagedisp()
        }else{
            imagedisplayNO = 0
            imagedisp()
        }
    }
    @IBAction func backButtonTap(_ sender: Any) {
        if imagedisplayNO >= 1 && imagedisplayNO < imagenameArray.count{
            imagedisplayNO -= 1
            imagedisp()
        }else{
            imagedisplayNO = imagenameArray.count - 1
            imagedisp()
        }
    }
    @objc func updatetimer(_ timer: Timer){
        if imagedisplayNO < imagenameArray.count - 1{
                 imagedisplayNO += 1
                 imagedisp()
             }else{
                 imagedisplayNO = 0
                 imagedisp()
             }
    }
    
    @IBAction func switchButtonTap(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updatetimer(_:)), userInfo: nil, repeats: true)
            
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
            switchButton.setTitle("停止", for: .normal)
            
        }else if timer != nil{
            timer.invalidate()
            timer = nil
            
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            switchButton.setTitle("再生", for: .normal)
        }
      
        }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newViewController:NewViewController = segue.destination as! NewViewController
        
       let name = imagenameArray[imagedisplayNO]
             let image = UIImage(named: name)
        newViewController.Zoomdisp = image
        
        
    }
    
    }
    




    //
    //  ViewController.swift
    //  Quizzler-iOS13
    //
    //  Created by Angela Yu on 12/07/2019.
    //  Copyright © 2019 The App Brewery. All rights reserved.
    //

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    let quiz = [
        ["Two is a prime number","True"],
        ["Hoe is a gardening tool","True"],
        ["I like reading", "True"]
    ]
    
    var questionNumber = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        
        if questionNumber == quiz.count{

            questionNumber = 0
            updateUi()
        }
        else{

            let userAns = sender.currentTitle!
            let actualAns = quiz[questionNumber][1]
            
            if(userAns == actualAns){
                print("Your right")
            }
            else{
                print("Your Wrong")
            }
            updateUi()
        }
        
        questionNumber += 1
   
    }
    
    func updateUi(){
        questionLabel.text = quiz[questionNumber][0]
    }
    
}


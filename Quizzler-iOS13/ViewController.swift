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
    
    let totalQuestions = quiz.count
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        updateUi()
        progressBar.progress = 0
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        ///angela way
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer{
            sender.backgroundColor = UIColor.green
            
            
        } else {
            sender.backgroundColor = UIColor.red
            
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            progressBar.progress = 0
        }
       
        
        /// Two ways to delay the updateUI
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUi()
        }
       
//        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
      
        ///My way
//
//        if questionNumber == quiz.count{
//
//            questionNumber = 0
//            updateUi()
//        }
//        else{
//
//            let userAns = sender.currentTitle!
//            let actualAns = quiz[questionNumber][1]
//
//            if(userAns == actualAns){
//                print("Your right")
//            }
//            else{
//                print("Your Wrong")
//            }
//            updateUi()
//        }
//
//        questionNumber += 1
   
    }
    
    func updateUi(){
//        questionLabel.text = quiz[questionNumber][0]
        let progressPercentage = Float(questionNumber)/Float(totalQuestions)
        progressBar.setProgress(progressPercentage, animated: true)
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
    //Using a Timer
    @objc func updateUI(){
        let progressPercentage = Float(questionNumber)/Float(totalQuestions)
        progressBar.setProgress(progressPercentage, animated: true)
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}


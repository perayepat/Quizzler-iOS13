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
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var optionalButton: UIButton!
    
    let totalQuestions = quiz.count
    var quizBrain  = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        updateUi()
        optionalButton.isEnabled = false
        optionalButton.alpha = 0 
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
            ///angela way
        let userAnswer = sender.currentTitle!
        let userIsCorrect =  quizBrain.checkAnswer(userAnswer)
        
        if userIsCorrect{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        
        quizBrain.nextQuestion()
            /// Two ways to delay the updateUI
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            updateUi()
        }
        
          //  Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    
    
    func updateUi(){
        
        let progressPercentage = quizBrain.getProgress()
        progressBar.setProgress(progressPercentage, animated: true)
        questionLabel.text = quizBrain.getQuestionText()
        
        scoreLabel.text = "Score : \(quizBrain.userScore)"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
  
    }
    
        //Using a Timer
    @objc func updateUI(){
        let progressPercentage = quizBrain.getProgress()
        progressBar.setProgress(progressPercentage, animated: true)
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score : \(quizBrain.userScore)"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}


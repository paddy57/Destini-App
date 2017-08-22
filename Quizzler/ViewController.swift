//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //intialising object of QuestionBank class
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    
    var questionNumber: Int = 0
    var score: Int = 0
    
    
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        let firstQuestion = allQuestions.list[0]
//        
//        questionLabel.text = firstQuestion.questionText
        
        nextQuestion()
        
        updateUI()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        
                if sender.tag == 1 {
            
            pickedAnswer = true
        }
        else if sender.tag == 2{
            
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
       
        
        updateUI()
        nextQuestion()
  
    }
    
    
    func updateUI() {
        
          progressLabel.text = "\(questionNumber + 1) /13"
        
          scoreLabel.text = "score: \(score) "
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
      
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
          questionLabel.text = allQuestions.list[questionNumber].questionText
            
        }
        else{
        
            let alert = UIAlertController(title: "Awesome", message: "DONE WITH QUIZ", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            
            score += 10
//            print(score)
//            print("you got it")
            ProgressHUD.showSuccess("Correct")
        }
        else {
//        print("It's wrong")
            
            ProgressHUD.showError("Wrong!")
            
        }
        
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
        
       
    }
    

    
}

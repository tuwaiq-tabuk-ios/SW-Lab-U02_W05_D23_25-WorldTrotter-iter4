//
//  ViewController.swift
//  Trivial Single Choice
//
//  Created by Bushra alatwi on 12/03/1443 AH.
//

import UIKit

class Quiz: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var scoreLabel: UILabel!
  
  @IBOutlet weak var trueButton: UIButton!
  
  @IBOutlet weak var falseButton: UIButton!
  
  @IBOutlet weak var progressView: UIProgressView!
  
  var quizManager = QuizManager()
  var change = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureButtons()
    updateUI()
    progressView.progress = 0.0
  }
  
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle!
    
    let check = quizManager.checkAnswer(userAnswer)
    
    if check {
      sender.backgroundColor = .systemGreen
    }
    else {
      sender.backgroundColor = .systemRed
    }
    
    if quizManager.nextQuestion(){   Timer.scheduledTimer(timeInterval:1.2,
                         target: self,
                         selector: #selector(updateUI),
                         userInfo: nil,
                         repeats: false
    )
    }
    else{
      showGameOverAlertMessage()
    }
  
    
    
  }
  
  
  @objc func updateUI(){
    
    questionLabel.text = quizManager.getQuestion()
    progressView.progress = quizManager.getProgress()
    scoreLabel.text = "Score: \(quizManager.getScore())"
    
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
    
    
    //true_Button.setTitle(quizManager.getChoices), for: .normal)
    // fulse_button.setTitle(quizManager.getChoices), for: .normal)
  }
  
  
  func startGame(action : UIAlertAction! = nil) {
    print(#function)
    quizManager.startGame()
    updateUI()
  }
  
  
  func showGameOverAlertMessage(){
    
    let ac = UIAlertController(title: "GAME OVER",
                               message: "Your scores is\(quizManager.getScore ())",
                               preferredStyle: .alert )
    ac.addAction(UIAlertAction(title:"Play Again", style:.default, handler:startGame))
    present(ac, animated: true)
  }
  
  
  func configureButtons() {
    trueButton.layer.cornerRadius = 15
    trueButton.layer.masksToBounds = true
    trueButton.layer.borderWidth = 2
    trueButton.layer.borderColor = UIColor.black.cgColor
    falseButton.layer.cornerRadius = 15
    falseButton.layer.masksToBounds = true
    falseButton.layer.borderWidth = 2
   falseButton.layer.borderColor = UIColor.black.cgColor
  }
  
}


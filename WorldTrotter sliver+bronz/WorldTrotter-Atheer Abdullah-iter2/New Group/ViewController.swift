//
//  ViewController.swift
//  Taa
//
//  Created by Atheer abdullah on 14/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  var quizManager: QuizManager = QuizManager()
  var change = 0
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  @IBOutlet weak var progressBar: UIProgressView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    trueButton.layer.cornerRadius = 15
    trueButton.layer.backgroundColor = UIColor.white.cgColor
    trueButton.layer.borderWidth = 3
    trueButton.layer.borderColor = UIColor.white.cgColor
    
    falseButton.layer.cornerRadius = 15
    falseButton.layer.borderWidth = 3
    falseButton.layer.borderColor = UIColor.white.cgColor
    scoreLabel.text = "Score: \(quizManager.getScore())"
    updateUI()
    
  }
  
  @IBAction func answerSelected(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle!
    let check = quizManager.checkAnswer(userAnswer)
    
    if check {
      sender.backgroundColor = .systemGreen
      
    }
    
    else {
      sender.backgroundColor = .systemRed
      
    }
    if quizManager.nextQuestion() {
      Timer.scheduledTimer(timeInterval: 1.2,
                           target: self,
                           selector: #selector(updateUI),
                           userInfo: nil,
                           repeats: false)
      
    } else {
      showGameOverAlertMessage()
    }
  }
  
  @objc func updateUI(){
    scoreLabel.text = String(quizManager.getScore())
    questionLabel.text = quizManager.getQuestion()
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
    progressBar.progress = quizManager.getProgress()
    
  }
  
  func startGame(action: UIAlertAction! = nil){
    print(#function)
    quizManager.startGame()
    updateUI()
    
  }
  
  func showGameOverAlertMessage(){
   
      
    let ac = UIAlertController(title: "game Over", message: " Your Score is \(quizManager.getScore()) out of 5", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "Okay", style: .cancel , handler: startGame))
      present(ac, animated : true, completion: nil)
  
    
  }
  
    }
    

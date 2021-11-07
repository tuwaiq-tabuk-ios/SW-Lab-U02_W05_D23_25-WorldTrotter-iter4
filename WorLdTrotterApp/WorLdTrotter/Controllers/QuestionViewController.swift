//
//  questionViewController.swift
//  WorLdTrotter
//
//  Created by ahlam  on 21/03/1443 AH.
//

import UIKit
import AVFoundation


class QuestionViewController: UIViewController {
  
  @IBOutlet weak var valueScoreLable: UILabel!
  
  @IBOutlet weak var questionLable: UILabel!
  
  @IBOutlet weak var firstChoiceButtom: UIButton!
  @IBOutlet weak var secandChoiceBottom: UIButton!
  @IBOutlet weak var thirdChoiceButton: UIButton!
  @IBOutlet weak var fourthChoiceButton: UIButton!
  
  @IBOutlet weak var progressBottom: UIProgressView!
  
  
  var quizManager = QuizManager()
  
  var player: AVAudioPlayer?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureLabels()
    configureButtons()
    startGame()
    updateUI()
  }
  
  
  @IBAction func answerSelected(_ sender: UIButton) {
    
    guard let userAnswer = sender.currentTitle else {
      return
    }
      
    let userAnswerIsCorrect = quizManager.checkAnswer(userAnswer)
    
    if userAnswerIsCorrect {
      sender.backgroundColor = UIColor.green
    }
    else {
      sender.backgroundColor = UIColor.red
    }
    
    
    Timer.scheduledTimer(timeInterval: 1,
                         target: self,
                         selector: #selector(updateUI),
                         userInfo: nil,
                         repeats: false)
    
    
    if quizManager.nextQuestion() {

    } else {
      showGameOverAlertView()
    
      if quizManager.hasUserGoodScore() {
         playSound()
      }
    }

  }
  
  
  func configureLabels() {
    questionLable.layer.borderColor = UIColor.white.cgColor
    questionLable.layer.cornerRadius = 50
    questionLable.layer.borderWidth = 3
    questionLable.layer.masksToBounds = true
  }
  
  
  func configureButtons() {
    firstChoiceButtom.layer.borderColor = UIColor.white.cgColor
    firstChoiceButtom.layer.cornerRadius = 20
    firstChoiceButtom.layer.borderWidth = 3
    firstChoiceButtom.layer.masksToBounds = true
    
    secandChoiceBottom.layer.borderColor = UIColor.white.cgColor
    secandChoiceBottom.layer.cornerRadius = 20
    secandChoiceBottom.layer.borderWidth = 3
    secandChoiceBottom.layer.masksToBounds = true
    
    thirdChoiceButton.layer.borderColor = UIColor.white.cgColor
    thirdChoiceButton.layer.cornerRadius = 20
    thirdChoiceButton.layer.borderWidth = 3
    thirdChoiceButton.layer.masksToBounds = true
    
    fourthChoiceButton.layer.borderColor = UIColor.white.cgColor
    fourthChoiceButton.layer.cornerRadius = 20
    fourthChoiceButton.layer.borderWidth = 3
    fourthChoiceButton.layer.masksToBounds = true
  }
  
  
  func startGame() {
    quizManager.startGame()
    updateUI()
  }
  
  
  @objc func updateUI(){
    questionLable.text = quizManager.getQuestion()
    progressBottom.progress = quizManager.getProgress()
    valueScoreLable.text = "\(quizManager.getScore())"
    
    let possibleAnswers = quizManager.getChoices()
    
    firstChoiceButtom.setTitle(possibleAnswers[0], for: .normal);
    secandChoiceBottom.setTitle(possibleAnswers[1], for: .normal)
    thirdChoiceButton.setTitle(possibleAnswers[2], for: .normal)
    fourthChoiceButton.setTitle(possibleAnswers[3], for: .normal)
    
    firstChoiceButtom.backgroundColor = UIColor.clear
    secandChoiceBottom.backgroundColor = UIColor.clear
    thirdChoiceButton.backgroundColor = UIColor.clear
    fourthChoiceButton.backgroundColor = UIColor.clear
  }
  
  
  func showGameOverAlertView() {
    let alert = UIAlertController(title: "End game 🥳",
                                  message: "play agin?",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Yes",
                                  style: .cancel,
                                  handler: { action in
      print("Yes clicked")
      self.startGame()
    }))
    
    alert.addAction(UIAlertAction(title: "No",
                                  style: .default,
                                  handler: nil))
    
    present(alert,
            animated: true,
            completion: nil)
  }
  
  
  func playSound() {
    guard let url = Bundle.main.url(
      forResource: "Clapping Sound Effects - Applause - Audience - Crowd Sound Effect (128  kbps) (shabakngy.com)",
      withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      /* iOS 10 and earlier require the following line:
       player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
      
      guard let player = player else { return }
      
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }

}



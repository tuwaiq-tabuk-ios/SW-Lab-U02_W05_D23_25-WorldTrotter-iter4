//
//  questionViewController.swift
//  WorldTrotter- Programmatically-Bushra Alatawi-iter1
//
//  Created by bushra nazal alatwi on 21/03/1443 AH.
//

import UIKit
import AVFoundation
class questionViewController: UIViewController{
    
    @IBOutlet weak var valueScoreLable: UILabel!
    
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secandChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var fourthChoiceButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var quizManager = QuizManager()
    
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
        updateUI()
        startGame()
        configureLabels()
        
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
        firstChoiceButton.layer.borderColor = UIColor.white.cgColor
        firstChoiceButton.layer.cornerRadius = 20
        firstChoiceButton.layer.borderWidth = 3
        firstChoiceButton.layer.masksToBounds = true
        
        secandChoiceButton.layer.borderColor = UIColor.white.cgColor
        secandChoiceButton.layer.cornerRadius = 20
        secandChoiceButton.layer.borderWidth = 3
        secandChoiceButton.layer.masksToBounds = true
        
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
        progressView.progress = quizManager.getProgress()
        valueScoreLable.text = "\(quizManager.getScore())"
        
        let possibleAnswers = quizManager.getChoices()
        
        firstChoiceButton.setTitle(possibleAnswers[0], for: .normal);
        secandChoiceButton.setTitle(possibleAnswers[1], for: .normal)
        thirdChoiceButton.setTitle(possibleAnswers[2], for: .normal)
        fourthChoiceButton.setTitle(possibleAnswers[3], for: .normal)
        
        firstChoiceButton.backgroundColor = UIColor.clear
        secandChoiceButton.backgroundColor = UIColor.clear
        thirdChoiceButton.backgroundColor = UIColor.clear
        fourthChoiceButton.backgroundColor = UIColor.clear
    }
    
    
    func showGameOverAlertView() {
        let alert = UIAlertController(title: "End game",
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
            forResource: "clap",
            withExtension: "wav") else { return }
        
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

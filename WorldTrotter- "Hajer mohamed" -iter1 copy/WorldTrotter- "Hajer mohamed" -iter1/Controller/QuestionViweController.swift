//
//  QuestionViweController.swift
//  WorldTrotter- "Hajer mohamed" -iter1
//
//  Created by hajer . on 21/03/1443 AH.
//

import UIKit
import AVFoundation
class questionViewController: UIViewController {
    
    @IBOutlet weak var valueScoreLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secandChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var fourthChoiceButton: UIButton!
    @IBOutlet weak var progressButton: UIProgressView!
    
    
    // Do any additional setup after loading the view.
    
    var quizManager = QuizManager()
    var questionNumber:Int = 0
    var score = 0
    var player: AVAudioPlayer?
    var nextQuestion:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstChoiceButton.layer.cornerRadius = 25
        firstChoiceButton.layer.borderWidth = 3
        firstChoiceButton.layer.masksToBounds = true
        firstChoiceButton.layer.borderColor = UIColor.white.cgColor
        firstChoiceButton.titleLabel?.minimumScaleFactor = 0.5
        
        secandChoiceButton.layer.cornerRadius = 25
        secandChoiceButton.layer.borderWidth = 3
        secandChoiceButton.layer.masksToBounds = true
        secandChoiceButton .layer.borderColor = UIColor.white.cgColor
        secandChoiceButton.titleLabel?.minimumScaleFactor = 0.5
        
        thirdChoiceButton.layer.cornerRadius = 25
        thirdChoiceButton.layer.borderWidth = 3
        thirdChoiceButton.layer.masksToBounds = true
        thirdChoiceButton .layer.borderColor = UIColor.white.cgColor
        thirdChoiceButton.titleLabel?.minimumScaleFactor = 0.5
        
        
        fourthChoiceButton.layer.cornerRadius = 25
        fourthChoiceButton.layer.borderWidth = 3
        fourthChoiceButton.layer.masksToBounds = true
        fourthChoiceButton .layer.borderColor = UIColor.white.cgColor
        fourthChoiceButton.titleLabel?.minimumScaleFactor = 0.5
        
        updateUI()
        progressButton.progress = 0.0
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let check = quizManager.checkAnswer(userAnswer)
        
        if check{
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        if quizManager.nextQuestion() {
            
        }
        else {
            showAlertView()
        }
    }
    
    
    @objc func updateUI(){
        questionLable.text = quizManager.checkQuestion()
        progressButton.progress = quizManager.checkProgress()
        valueScoreLable.text = "\(quizManager.checkScore())"
        
        
        firstChoiceButton.backgroundColor = UIColor.clear
        secandChoiceButton.backgroundColor = UIColor.clear
        thirdChoiceButton.backgroundColor = UIColor.clear
        fourthChoiceButton.backgroundColor = UIColor.clear
        
        
        firstChoiceButton.setTitle(quizManager.checkChoices()[0], for: .normal);
        secandChoiceButton.setTitle(quizManager.checkChoices()[1], for: .normal)
        thirdChoiceButton.setTitle(quizManager.checkChoices()[2], for: .normal)
        fourthChoiceButton.setTitle(quizManager.checkChoices()[3], for: .normal)
    }
    
    
    func showAlertView() {
        let alert = UIAlertController(title: "game over",
                                      message: "play agine?",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes",
                                      style: .cancel,
                                      handler: { action in
                                      print("Yes clicked")
                                      self.start()
                                      }))
        
        alert.addAction(UIAlertAction(title: "No",
                                      style: .default,
                                      handler: nil))
                                      present(alert,
                                      animated: true,
                                      completion: nil)
                                      playSound()
    }
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "clap", withExtension: "wav") else { return }
        
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
    
    func start() {
        quizManager.start()
        updateUI()
    }
}

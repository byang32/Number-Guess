//
//  ViewController.swift
//  Number Guess
//
//  Created by Bee Yang on 11/2/17.
//  Copyright © 2017 Bee Yang. All rights reserved.
//
import Darwin
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numGuess: UITextField!
    
    @IBOutlet weak var guessOutput: UILabel!
    //
    // Create tries variable to track number of tries
    var tries = 0
    
    // Creat random target integer between 1 and 100 , using arc4random().
    var target = Int(arc4random_uniform(100) + 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGame()
    }

    @IBAction func guessBut(_ sender: Any) {
        
        //
        // Set up if statement
        // If numGuess is not nil and between 1 to 100
        // then guess is valid integer
        //
        if Int(numGuess.text!) != nil && Int(numGuess.text!)! > 0 && Int(numGuess.text!)! <= 100 {
            tries += 1
            
            if Int(numGuess.text!)! > target {
                guessOutput.text = "Your guess was to high! \nTry again!\nNumber of guess(s): \(tries) "
            
            
            } else if Int(numGuess.text!)! < target {
                guessOutput.text = "Your guess was to low! \nTry again! \nNumber of guess(s): \(tries) "
    
            } else {
                let alert = UIAlertController(title:"Correct!", message:"Winner, winner chicken dinner! You guessed \(target). It only took you \(tries) guesse(s).", preferredStyle:UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title:"Play Again",style: UIAlertActionStyle.default, handler: { (ACTION) in
                    self.setupGame()
                }))
                alert.addAction(UIAlertAction(title:"Quit",style: UIAlertActionStyle.default, handler: { (ACTION) in
                exit(0)
                }))
                
                
                self.present(alert, animated:true, completion:nil)
            
            }
            
        } else {
            guessOutput.text = "Please enter a valid number!"
            
        }
        
        //
        // Clear numGuess UITextField
        //
        numGuess.text = ""

    }
    
    //
    // Create setuptGame () to restart the game
    //
    func setupGame() {
        numGuess.text = ""
        tries = 0
        target = Int(arc4random_uniform(100) + 1)
        guessOutput.text = ""
        
    }
    
    
}




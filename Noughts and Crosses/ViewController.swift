//
//  ViewController.swift
//  Noughts and Crosses
//
//  Created by Divakar Kapil on 2016-05-29.
//  Copycenter © 2016 Divakar Kapil. All centers reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.hidden = true
        resultLabel.center = CGPointMake(resultLabel.center.x-500, resultLabel.center.y)
        
        resetButton.hidden = true
        resetButton.center = CGPointMake(resetButton.center.x-500, resetButton.center.y)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    var gameState = [0,0,0,0,0,0,0,0,0]  // Keep track of the state of a button to prevent overwriting
    var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var activePlayer = 1  // 1 means button displays a nought and 2 means that the button displays a cross
    var gameOver = false

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func resetFunc(sender: AnyObject) {
        
            
        gameReset()
        
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameOver == false{
            
            if gameState[sender.tag] == 0{
                
                gameState[sender.tag] = activePlayer
                
                if activePlayer == 1{
                    
                    sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                    activePlayer = 2
                    
                }
                    
                else{
                    
                    sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                    activePlayer = 1
                }
                
            }
            
            
            for combinations in winningCombinations{
                
                if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]]{
                    
                    resultLabel.hidden = false
                    UIView.animateWithDuration(0.5, animations: {
                        self.resultLabel.center = CGPointMake(self.resultLabel.center.x+500, self.resultLabel.center.y)
                    })
                    
                    resetButton.hidden = false
                    UIView.animateWithDuration(0.5, animations: {
                        self.resetButton.center = CGPointMake(self.resetButton.center.x+500, self.resetButton.center.y)
                    })
                    
                    
                    if gameState[combinations[0]] == 1{
                        resultLabel.text = "Nougts have won !"
                    }
                        
                        
                    else if gameState[combinations[0]] == 2{
                        
                        resultLabel.text = "Crosses have won !"
                    }
                    
                    gameOver = true

                }
                
            }
            
        gameOver = true
            
            for buttonState in gameState{
                
                if buttonState == 0{
                    
                    gameOver = false
                }
               
            }
         
            
            
            if gameOver == true{
                resultLabel.hidden = false
                UIView.animateWithDuration(0.5, animations: {
                    self.resultLabel.center = CGPointMake(self.resultLabel.center.x+500, self.resultLabel.center.y)
                })
                
                resetButton.hidden = false
                UIView.animateWithDuration(0.5, animations: {
                    self.resetButton.center = CGPointMake(self.resetButton.center.x+500, self.resetButton.center.y)
                })
                
                resultLabel.text = "It's a Draw"
                
            }
            
        }
        
        
        
    }

   
    func gameReset(){
        
        gameOver = false
        gameState = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1
        
        resultLabel.hidden = true
        resultLabel.center = CGPointMake(resultLabel.center.x-500, resultLabel.center.y)
        
        resetButton.hidden = true
        resetButton.center = CGPointMake(resetButton.center.x-500, resetButton.center.y)
        
        // To clear all buttons
        
        var buttonToClear : UIButton
        
        for var i = 0; i<9 ; i=i+1{
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            // every UIComponent on a view has a tag number so we need to explixitly tell iOS that the tags we are referring to are that of buttons; Also we need to change the tag number of every elememt which is not a button from 0 to any other number as iOS will try to first change every thing with a tag of 0 to a UIButton and willcrash in the process.
            
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    
}





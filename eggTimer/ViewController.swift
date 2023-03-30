//
//  ViewController.swift
//  eggTimer
//
//  Created by Giselle RS on 07/03/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var labelEggsDone: UILabel!
    @IBOutlet weak var progressEggTimer: UIProgressView!
    
    //dictionary
    let eggTimes: [String:Float] = ["Soft": (5*60), "Medium": (8*60), "Hard": (12*60)]
    var timer = Timer()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressEggTimer.progress = 0.0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        self.player?.stop()
        //para que solo este un timer a la vez y no varios al mismo tiempo
        timer.invalidate()
        
        let hardness = sender.currentTitle!
       // print(hardness!)
        
        var seconds: Float = (eggTimes[hardness]! )
        //print("egg Timer prueba \(eggTimes[hardness]!)")

        progressEggTimer.progress = 0.0
        labelEggsDone.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            //self.labelEggsDone.text = "How do you like your eggs?"
            //self.progressEggTimer.progress = 0.0
           
            seconds -= 1
            if seconds == 0 {
                self.labelEggsDone.text = "The eggs are done"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player!.play()
                
                //print(self.labelEggsDone.text!)
                
                self.progressEggTimer.progress = 1
                
                timer.invalidate()
                
            } else {
                //print("\(seconds) segundos")
                //print(1.0 - (seconds / self.eggTimes[hardness]!))
                
                self.progressEggTimer.progress = (1.0 - (seconds / self.eggTimes[hardness]!))
                //print(("\(self.progressEggTimer.progress) actualizacion en la barra "))
            }
        }
        //Switch
        /*
        switch hardness {
        case "Soft":
            print("prueba")
            print(eggTimes["softTime"]!)
        case "Medium":
            print("prueba 2")
            print(eggTimes["mediumTime"]!)
        case "Hard": 
            print("prueba 3")
            print(eggTimes["hardTime"]!)
        default:
            print("Error")
        }*/
        
        /*
        if hardness == "Soft" {
            print("\(softTime) soft egg")
        }
        if hardness == "Medium" {
            print("\(mediumTime) medium egg")
        }
        if hardness == "Hard" {
            print("\(hardTime) hard egg")
        }
        */
        // EJERCICIO 1
       /* func loveCalculator() {
            var loveScore = Int.random(in: 0...100)
            print(loveScore)
            if loveScore <= 40 {
                print("El numero \(loveScore) esta entre 0 y 40")
                
            } else if loveScore > 40 && loveScore < 80{
                print("El numero \(loveScore) esta entre 41 y 80")
                
            } else if loveScore > 80 {
                print("El numero \(loveScore) esta entre 81 y 100")
            }
        }
        loveCalculator()
        */
        
        //EJERCICIO 2
        /*func loveCalculator2(){
            var loveScore1 = Int.random(in: 0...100)
            print(loveScore1)
            
            switch  loveScore1 {
            case  ...40:
                print("menos de 40 prueba 1")
            case 40...80:
                print("de 40 a 80")
            case 80...:
                print("mayor de 80")
            default:
                print("Default")
            }
        }
        loveCalculator2()
        */
        
    }
    

}

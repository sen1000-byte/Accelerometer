//
//  GameViewController.swift
//  Accelerometer
//
//  Created by Chihiro Nishiwaki on 2021/02/08.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    @IBOutlet var awaImageView: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double! = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!){data, error in
                self.accelerationX = (data?.acceleration.x)
                self.awaImageView.center.x += CGFloat(self.accelerationX*20)
                if self.awaImageView.frame.origin.x < 33{
                    self.awaImageView.frame.origin.x = 33
                }
                
                if self.awaImageView.frame.origin.x > 252 {
                    self.awaImageView.frame.origin.x = 252
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewCtontroller: ResultViewController = segue.destination as! ResultViewController
        resultViewCtontroller.accelerationX = self.accelerationX
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

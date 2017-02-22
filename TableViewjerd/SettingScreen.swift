//
//  SettingScreen.swift
//  TableViewjerd
//
//  Created by Yuki Yamamoto on 2017/02/23.
//  Copyright © 2017年 yuki yamamoto. All rights reserved.
//

import UIKit
import MessageUI


class SettingScreen: UIViewController, MFMailComposeViewControllerDelegate {
    
 
    @IBAction func backToHomeScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func sendMail(_ sender: Any) {
        let mailCompose = MFMailComposeViewController()
        
        mailCompose.mailComposeDelegate = self
        
        mailCompose.setToRecipients(["uliktodrinksodowe@gmail.com"])
        
        mailCompose.setSubject("フィードバック")
        
        mailCompose.setMessageBody("Nakazato Shohei ?", isHTML: false)
        
        
        
        if MFMailComposeViewController.canSendMail()
            
        {
            
            self.present(mailCompose, animated: true, completion: nil)
            
        }
            
        else{
            
            print("ちっす...!")
            
        }
    }
    

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

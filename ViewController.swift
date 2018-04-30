//
//  ViewController.swift
//  JayWrkrIoT
//
//  Created by Juan Jaramillo on 30/04/18.
//  Copyright © 2018 Juan Jaramillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        httpPost()
    }

  
    
    func httpGet(){
        
        let url = URL(string: "https://xxxx.xxx")!
        
        let request = URLRequest(url: url)
       
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error as Any)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print(response as Any)
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print(responseString as Any)
        }
        task.resume()
        
     }
    
    func httpPost(){
        
        let url = URL(string: "https://xxxx.xxx")!
        
        var request = URLRequest(url: url)
    
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "id=13&name=Jack"
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error as Any)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print(response as Any)
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print(responseString as Any)
        }
        task.resume()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


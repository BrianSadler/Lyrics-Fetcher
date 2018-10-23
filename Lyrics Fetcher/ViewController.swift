//
//  ViewController.swift
//  Lyrics Fetcher
//
//  Created by Brian Sadler on 10/23/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var songTextField: UITextField!
    @IBOutlet weak var lyricsTextView: UITextView!
    let lyricsAPIBaseURL = "https://api.lyrics.ovh/v1/"
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        guard let artistName = artistTextField.text,
        let songTitle = songTextField.text
        else {
            return
        }
        let artistNameURLComponent = artistName.replacingOccurrences(of: " ", with: "+")
        
        let songTitleURLComponent = songTitle.replacingOccurrences(of: " ", with: "+")
        
        let requestURL = lyricsAPIBaseURL + artistNameURLComponent + "/" + songTitleURLComponent
    let request = Alamofire.request(requestURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        request.responseJSON { response in
            switch response.result {
                case .success(let value):
                
                print("success")
                
                let Json = JSON(value)
                
                self.lyricsTextView.text = Json["lyrics"].stringValue
                
                case .failure(let error):
                print("Error")
                
            print(error.localizedDescription)
            }
            
        }
    }
                

    @IBOutlet weak var buttonTapped: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}



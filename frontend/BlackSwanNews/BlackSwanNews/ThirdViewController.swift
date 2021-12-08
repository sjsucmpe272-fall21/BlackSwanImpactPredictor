//
//  ThirdViewController.swift
//  BlackSwanNews
//
//  Created by Puneet Tokhi on 12/1/21.
//

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

import UIKit
import Alamofire

var chart: UIImage? = nil
var news_sentiment: String = ""
var news_impactScore: Double = 0.0

var news_type: String = ""

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var impactScoreLabel: UILabel!
    @IBOutlet weak var sentimentLabel: UILabel!
    @IBOutlet weak var chartImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapped(_ sender: UIButton) {
        let data = getImpactScore()

        if data.imageData != nil{
            sentimentLabel.text = data.sentiment
            impactScoreLabel.text = String(data.score.rounded(toPlaces: 4))
            chartImage.image = data.imageData

        }
    }
    
    public func getImpactScore()->(imageData: UIImage?,  sentiment: String, score: Double){
        let json = ["data_type": news_type]
        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [])

        // passing the backend model URL as input
        let url = URL(string: "http://18.222.25.85:5000/api/process-model")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.httpBody = jsonData
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return

            }
            
            // displaying the result in the front end
            let responseData = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseData = responseData as? [String: Any] {
                for (key, value) in responseData{
                    if key == "file_content"{
                        chart = self.convertBase64StringToImage(imageBase64String: value as! String)
                    }
                    if key == "sentiment"{
                        news_sentiment = (value as! String)

                    }
                    if key == "impact_score"{
                        news_impactScore = (value as! Double)
                    }
                }
                
            }
            else{
                print(error as Any)
            }

        }
        task.resume()
        
        let result = (chart, news_sentiment, news_impactScore)
        return result
    }
    
    // function to convert the base64 string returned by the backend to a UI image object
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)
        return image!
    }
}


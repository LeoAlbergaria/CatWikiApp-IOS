//
//  DetailsViewController.swift
//  Cat App
//
//  Created by Leonardo Albergaria on 17/11/21.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var breed:Cat?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameLabel.text = breed?.name
        temperamentLabel.text = breed?.temperament
        descriptionLabel.text = breed?.description
        
        imageRequest(with: breed?.image?.url)
        
    }
    
    func imageRequest(with url: String?) {
        let safeUrl = breed?.image?.url ?? "https://www.cer-cavalos.com/images/not_found.png"
        
        AF.request( safeUrl,method: .get).response{ response in

           switch response.result {
            case .success(let responseData):
                self.imageView.image = UIImage(data: responseData!, scale:1)

            case .failure(let error):
                print(error)
            }
        }
    }

}

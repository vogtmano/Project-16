//
//  WikiVC.swift
//  Project16.1
//
//  Created by Maks Vogtman on 14/12/2022.
//

import UIKit
import WebKit

enum City: String {
    case london = "https://en.wikipedia.org/wiki/London"
    case paris = "https://en.wikipedia.org/wiki/Paris"
    case oslo = "https://en.wikipedia.org/wiki/Oslo"
    case warsaw = "https://en.wikipedia.org/wiki/Warsaw"
    case johannesburg = "https://en.wikipedia.org/wiki/Johannesburg"
    case lisbon = "https://en.wikipedia.org/wiki/Lisbon"
    case rioDeJaneiro = "https://en.wikipedia.org/wiki/Rio_de_Janeiro"
    case washington = "https://en.wikipedia.org/wiki/Washington"
    case beijing = "https://en.wikipedia.org/wiki/Beijing"
}

class WikiVC: UIViewController {
    var webView: WKWebView!
    var capital: Capital?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let capital = capital else { return }
        
        DispatchQueue.main.async { [unowned self] in
            switch capital.title {
            case "London":
                if let url = URL(string: City.london.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            
            case "Paris":
                if let url = URL(string: City.paris.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            
            case "Oslo":
                if let url = URL(string: City.oslo.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            
            case "Warsaw":
                if let url = URL(string: City.warsaw.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            
            case "Johannesburg":
                if let url = URL(string: City.johannesburg.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            
            case "Lisbon":
                if let url = URL(string: City.lisbon.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            
            case "Rio de Janeiro":
                if let url = URL(string: City.rioDeJaneiro.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            
            case "Washington":
                if let url = URL(string: City.washington.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            
            default:
                if let url = URL(string: City.beijing.rawValue) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            }
        }
    }
}

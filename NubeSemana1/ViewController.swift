//
//  ViewController.swift
//  NubeSemana1
//
//  Created by Hansel Ramos Osorio on 10/12/16.
//  Copyright © 2016 Hansel Ramos Osorio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        asincrono()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sincrono() -> Void {
        let urls = "http://dia.ccm.itesm.mx"
        let url = URL(string: urls)
        let datos:NSData? = NSData(contentsOf: url!)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
    }
    
    func asincrono() -> Void {
        let urls = "http://dia.ccm.itesm.mx"
        let url = URL(string: urls)
        let session = URLSession.shared
        let bloque = {
            (datos: Data?, resp: URLResponse?, error:Error?) -> Void in
                let texto = NSString(data: datos! as Data, encoding:String.Encoding.utf8.rawValue)
                print(texto)
        }
        let dt = session.dataTask(with: url!, completionHandler: bloque)
        dt.resume()
        print("Antes o despues")
    }


}


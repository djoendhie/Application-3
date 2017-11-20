//
//  DaftarViewController.swift
//  QuizStudentList
//
//  Created by SMK IDN MI on 11/16/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit
//import library
import Alamofire
import SwiftyJSON


class DaftarViewController: UIViewController {
    @IBOutlet weak var etUsername: UITextField!
    @IBOutlet weak var etPassword: UITextField!
    @IBOutlet weak var etEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnDaftar(_ sender: Any) {
        
        // deklarasi var untu mengambil nilai dari msg 2 widged
        let nilaiUser = etUsername.text
        let nilaiPassword = etPassword.text
        let nilaiEmail = etEmail.text
        
        //cek widget kosong
        if ((nilaiUser?.isEmpty)! || (nilaiEmail?.isEmpty)! || (nilaiPassword?.isEmpty)!){
            
            //muncul apakah dialog
            let alertWarning = UIAlertController(title: "Warning", message: "this is require", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "ok", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            //apabila widget tdk kosong
            // membuat parameter intuk d simpan ke data base
            let params = ["email" : nilaiEmail!, "password" : nilaiPassword!, "username" : nilaiUser]
            // mencetak nilai params yg d kirim
            print(params)
            
            let url = "http://localhost/kelas/index.php/api/getdaftar"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    
                    //muncul alert dialog
                    let alertWarning = UIAlertController(title: "congrats", message: "data tersimpan", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion: nil)
                    
                    
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//
//  DetailViewController.swift
//  QuizStudentList
//
//  Created by SMK IDN MI on 11/16/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var Nama: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Kelas: UILabel!
    @IBOutlet weak var Kelamin: UILabel!
    @IBOutlet weak var Telp: UILabel!
    @IBOutlet weak var Alamat: UILabel!
    
    var passnama:String?
    var passEmail:String?
    var passKelas:String?
    var passAlamat:String?
    var passTelp:String?
    var passKelamin:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Nama.text = passnama
        Email.text = passEmail
        Kelas.text = passKelas
        Alamat.text = passAlamat
        Telp.text = passTelp
        Kelamin.text = passKelamin

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

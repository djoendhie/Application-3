//
//  SiswaTableViewController.swift
//  Quizkelas
//
//  Created by SMK IDN MI on 11/16/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SiswaTableViewController: UITableViewController {
    
    var judSelected:String?
    var katSelected:String?
    var iSISelected:String?
    
    var nampungId : String? = nil
    var arraysiswa = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("id + " + nampungId!)
        
        let params = ["id_kelas" : nampungId]
        let url = "http://localhost/kelas/index.php/api/getsiswa"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                
     
                if response.result.isSuccess {
                    //kalau response suces kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get jsonaray dari json arrayq
                    self.arraysiswa = json["data"].arrayObject as! [[String : String]]
                    //check d log
                    //check jumlah array
                    if (self.arraysiswa.count > 0){
                        
                        //refresh tableview
                        self.tableView.reloadData()
                    }
                }
                else{
                    
                    print("error server")
                    
                }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraysiswa.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSiswa", for: indexPath) as! SiswaTableViewCell
        
        var serverid = arraysiswa[indexPath.row]
        
        var id = serverid["id_kelas"]
        let nama = serverid["Siswa"]
        let kelas = serverid["kelas"]
        let email = serverid["Email"]
        //print judul
        
        cell.labelNama.text = nama
        cell.labelEmail.text = email
        cell.labelKelas.text = kelas
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arraysiswa[indexPath.row]
        judSelected = task["id_siswa"] as! String
        katSelected = task["id_kelas"] as! String
        iSISelected = task["Siswa"] as! String
        
        
        performSegue(withIdentifier: "passIsi", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passIsi" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = arraysiswa[indexPath.row]
                
                controller.passnama = value["Siswa"] as! String
                controller.passEmail = value["Email"] as! String
                controller.passKelas = value["kelas"] as! String
                controller.passTelp = value["Telp"] as! String
                controller.passKelamin = value["Kelamin"] as! String
                controller.passAlamat = value["Alamat"] as! String
                
                
            }
        }
    }
     
    
}


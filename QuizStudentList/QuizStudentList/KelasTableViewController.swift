//
//  KelasTableViewController.swift
//  Quizkelas
//
//  Created by SMK IDN MI on 11/16/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class KelasTableViewController: UITableViewController {
    var arrkelas = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //memanggil data json menggunakan alamofire
        Alamofire.request("http://localhost/kelas/index.php/api/getkelas").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
                
                //if json ["data"].arrayObject != nil {
                self.arrkelas = json["data"].arrayObject as! [[String:String]]
                
                if self.arrkelas.count > 0 {
                    self.tableView.reloadData()
                }
            }
            else{
                print("eror server")
            }
        }
        
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
        return arrkelas.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKelas", for: indexPath) as! KelasTableViewCell
        
        // Configure the cell...
        var serverid = arrkelas[indexPath.row]
        
        //printserver id
        var id_kelas = serverid["id_kelas"]
        let Kelas = serverid["kelas"]
        
        //pindahkan label
        cell.labelKelas.text = Kelas
        
        return cell
    }
    //pindah ke label
    //dan melempar id kategori
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //deklarasi idStoryBoard untuk pindah halaman
        let idStoryBoard = storyboard?.instantiateViewController(withIdentifier: "cellSiswa") as! SiswaTableViewController
        let id_kelas = arrkelas[indexPath.row]["id_kelas"]
        //variable untuk menampung id_kategori yang dilempar
        idStoryBoard.nampungId = id_kelas!
        
        show(idStoryBoard, sender: self)
    }
    
    
    
}

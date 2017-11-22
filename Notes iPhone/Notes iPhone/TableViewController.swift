//
//  TableViewController.swift
//  Notes iPhone
//
//  Created by Gw on 25/10/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // deklarasi variable task sebagai object
    var tasks : [IPhone] = [] //Task ini dipanggil dari eniti yang sudah dibuat tadi
    
    //deklarasi context untuk persintent container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting height table view
        tableView.estimatedRowHeight = 650.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! TableViewCell
        
        //          cell.day.text = labelTask[indexPath.row]
        //        cell.judulBerita.text = judulBerita[indexPath.row]
        //        cell.tglBerita.text = tglData[indexPath.row]
        //        cell.isiBerita.text = isiBerita[indexPath.row]
        
        
        
        //deklarasi dataTask sebagai index dari tasks
        let dataTasks = tasks[indexPath.row]
        //mengambil data dengan atributs name_task
        if let myDataTask = dataTasks.ipx {
            //menampilkan data ke label
            cell.iphone.text = myDataTask
        }
        if let myDataTask1 = dataTasks.ipman {
            //menampilkan data ke label
            cell.versinye.text = myDataTask1
        }
        if let myDataTask2 = dataTasks.ip9 {
            //menampilkan data ke label
            cell.brandnye.text = myDataTask2
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method data()
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do {
            //kalau tidak ada, maka request downlad data
            tasks = try context.fetch(IPhone.fetchRequest())
        }
        catch {
            //kondisi apabila eror fetch data
            print("Fetching Failed")
        }
    }
    
    //menambahkan data untuk delete data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //mengecek menu swipe apabila editing stylenya delete
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as! AppDelegate) . saveContext()
            
            do {
                //retreive data
                tasks = try context.fetch(IPhone.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
}
}

//
//  RoomTypeTableViewController.swift
//  Hotel Codable
//
//  Created by student on 11/04/24.
//

import UIKit

protocol RoomTypeViewControllerDelegate : AnyObject {
    func roomTypeViewController(_controller: RoomTypeViewControllerDelegate, didselect roomType : RoomType)
}
class RoomTypeTableViewController: UITableViewController {
    var roomType :RoomType?
    weak var delegate : RoomTypeViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RoomType.allTypes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Room Type Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = RoomType.allTypes[indexPath.row].name
        content.secondaryText = "$ \(RoomType.allTypes[indexPath.row].price)"
        
        if RoomType.allTypes[indexPath.row] == self.roomType{cell.accessoryType = .checkmark}
        else{cell.accessoryType = .none }
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        roomType  = RoomType.allTypes[indexPath.row]
//        delegate?.roomTypeViewController(_controller: self, didselect: roomType)
        tableView.reloadData()
    }
    

}

//
//  ToDoDetayCell.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import UIKit

protocol ToDoDetayCellDeletage{
    func isCheck(indexPath:IndexPath)
}

class ToDoDetayCell: UITableViewCell {

    var delegate: ToDoDetayCellDeletage?
    var indexPath: IndexPath?
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var bittiButton: UIButton!
    @IBOutlet weak var yapilacaklarAdLabel: UILabel!
    @IBOutlet weak var bittiView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func bittiButtonPressed(_ sender: Any) {
        delegate?.isCheck(indexPath: indexPath!)
    }
    
}

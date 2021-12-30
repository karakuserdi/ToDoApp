//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 29.12.2021.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var todoView: UIView!
    @IBOutlet weak var todoAdLabel: UILabel!
    @IBOutlet weak var todoColorView: UIView!
    @IBOutlet weak var todoTarihLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI(){
        todoColorView.layer.cornerRadius = 15
        todoColorView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  SynopsisLenderNotesCell.swift
//  BiblioLand
//
//  Created by Salicca Dewi Rahajeng on 28/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class SynopsisLenderNotesCell: UITableViewCell, UITextViewDelegate {

    static let identifier = "SynopsisLenderNotesCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "SynopsisLenderNotesCell", bundle: nil)
    }
    
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var seeMoreBtn: UIButton!
    @IBOutlet weak var descriptionTxtViewHeight: NSLayoutConstraint!
    
   var txt_frame : CGRect! = CGRect()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        descriptionTxtView.delegate = self
    }
    
    
    func getRowHeightFromText(strText: String!) -> CGFloat{
        let textView: UITextView! = UITextView(frame: CGRect(x: self.descriptionTxtView.frame.origin.x, y: 0, width: self.descriptionTxtView.frame.size.width, height: 0))
        textView.text = strText
        
        //var txt_frame : CGRect! = CGRect()
        txt_frame = textView.frame

        var size : CGSize! = CGSize()
        size = txt_frame.size

        size.height = 100 + txt_frame.size.height

        return size.height
        
    }
    
    @IBAction func seeMoreButton(_ sender: UIButton) {
        if sender.tag == 0

        {

//            let height = self.getRowHeightFromText(strText: self.descriptionTxtView.text)
//
//            self.descriptionTxtView.frame = CGRect(x: self.descriptionTxtView.frame.origin.x, y: self.descriptionTxtView.frame.origin.y, width: self.descriptionTxtView.frame.size.width, height: height)
            let height = self.getRowHeightFromText(strText: self.descriptionTxtView.text)

            self.descriptionTxtViewHeight.constant = height

            //self.view.layoutIfNeeded()

            seeMoreBtn.setTitle("see less", for: .normal)

            sender.tag = 1

        }

        else
        //if sender.tag == 1
        {

//            self.descriptionTxtView.frame = CGRect(x: self.descriptionTxtView.frame.origin.x, y: self.descriptionTxtView.frame.origin.y, width: self.descriptionTxtView.frame.size.width, height: 116)

            self.descriptionTxtViewHeight.constant = 64

            //self.view.layoutIfNeeded()
            
            seeMoreBtn.setTitle("see more", for: .normal)

            sender.tag = 0

        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

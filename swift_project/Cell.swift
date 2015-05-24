//
//  Cell.swift
//  test
//
//  Created by lighter on 2015/5/23.
//  Copyright (c) 2015年 Lighter. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    var indexLabel: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)

        indexLabel = UILabel(frame: CGRectMake(10, 2, 300, 15));
        indexLabel.text = "";
        indexLabel.font = UIFont.systemFontOfSize(22)
        self.addSubview(indexLabel);
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

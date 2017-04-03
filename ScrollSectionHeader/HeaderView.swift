//
//  HeaderView.swift
//  ScrollSectionHeader
//
//  Created by Yuki Sumida on 2017/04/03.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class HeaderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collection: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func loadView() {
        let className = NSStringFromClass(type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nibName = className.components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        // カスタムViewのサイズを自分自身と同じサイズにする
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                      metrics:nil,
                                                      views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                      metrics:nil,
                                                      views: bindings))
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.red
        }
        else {
            cell.backgroundColor = UIColor.blue
        }
        return cell
    }
}

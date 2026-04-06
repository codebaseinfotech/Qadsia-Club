//
//  DropDownView.swift
//  Qadsia
//
//  Created by Kenil on 02/04/26.
//

import UIKit

class DropDownView: UIView {

    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.register(DropDownCell.nib, forCellReuseIdentifier: DropDownCell.identifier)
            tblView.delegate = self
            tblView.dataSource = self
        }
    }
    
    private let nibName = String(describing: DropDownView.self)
    
    // MARK: - view Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
     

}

// MARK: - TV Delegate & DataSource
extension DropDownView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DropDownCell.identifier) as! DropDownCell
        
        return cell
    }
    
}

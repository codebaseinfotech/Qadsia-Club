//
//  ContactUsView.swift
//  Qadsia
//
//  Created by Kenil on 07/04/26.
//

import UIKit

enum ContactUsType {
    case contactUs
    case helpAndSupport
}

class ContactUsView: UIView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFEmail: UILabel!
    @IBOutlet weak var lblSEmail: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    private let nibName = String(describing: ContactUsView.self)
    
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
    
    func config(_ type: ContactUsType = .contactUs) {
        switch type {
        case .contactUs:
            lblTitle.text = "Our contact details"
        case .helpAndSupport:
            lblTitle.text = "Help & Support"
        }
    }

}

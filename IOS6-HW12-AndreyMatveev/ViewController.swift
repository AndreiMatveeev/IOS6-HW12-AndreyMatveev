import UIKit

class ViewController: UIViewController {

    private lazy var timeLabel: UILabel = {
        var label = UILabel()
        label.text = "25:00"
        label.font = .systemFont(ofSize: 50)
        label.textColor = UIColor.systemRed
        return label
    }()
    
    private lazy var playPaseButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = UIColor.systemRed
        button.addTarget(self, action: #selector(playPaseButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Add stack
    
    private lazy var timeAndButtonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(playPaseButton)
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuphierarhy()
        setupLayout()
    }
    
    // MARK: - Settings
    
    private func setuphierarhy() {
        view.addSubview(timeLabel)
        view.addSubview(playPaseButton)
    }
    
    private func setupLayout() {
        
        timeAndButtonStackView.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = timeAndButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let verticalConstraint = timeAndButtonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            let widthConstraint = timeAndButtonStackView.widthAnchor.constraint(equalToConstant: 140)
            let heightConstraint = timeAndButtonStackView.heightAnchor.constraint(equalToConstant: 100)
            view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

    // MARK: - Action
    
    @objc private func playPaseButtonAction() {
        
    }

}



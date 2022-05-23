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
    
    var timer = Timer()
        var isTimeStarted = false
        var isWorkTime = true
        var isAnimationStarted = false
        var time = 5
    
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
        if !isTimeStarted{
                    startTimer()
                    isTimeStarted = true
                    playPaseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                } else {
                    timer.invalidate()
                    isTimeStarted = false
                    playPaseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
                }

    }
    
    func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        }
        
        @objc func updateTimer() {
            if time < 1 && isWorkTime {
                playPaseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
                timer.invalidate()
                time = 5
                isWorkTime = false
                isTimeStarted = false
                timeLabel.text = "05:00"
                timeLabel.textColor = UIColor.systemGreen
                playPaseButton.tintColor = UIColor.systemGreen
            }else if time < 1 && !isWorkTime {
                playPaseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
                timer.invalidate()
                time = 5
                isWorkTime = true
                isTimeStarted = false
                timeLabel.text = "25:00"
                timeLabel.textColor = UIColor.systemRed
                playPaseButton.tintColor = UIColor.systemRed
            } else {
                time -= 1
                timeLabel.text = formatTime()
            }
        }
        
        func formatTime() -> String {
            let minutes = Int(time) / 60 % 60
            let second = Int(time) % 60
            
            return String(format: "%02i:%02i", minutes, second)
        }


}



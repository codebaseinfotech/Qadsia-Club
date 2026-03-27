//
//  ViewController.swift
//  Qadsia Club
//
//  Created by Ankit Gabani on 05/02/26.
//

import UIKit
import ImageIO

class ViewController: UIViewController {

    private var gifImageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupSplashGif()
    }

    private func setupSplashGif() {
        guard let gifPath = Bundle.main.path(forResource: "SplashVideo2", ofType: "gif"),
              let gifData = NSData(contentsOfFile: gifPath) as Data? else {
            print("❌ GIF file not found in bundle!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.navigateToLogin()
            }
            return
        }
        print("✅ GIF found at: \(gifPath)")

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        gifImageView = imageView

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -50),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])

        if let (images, duration) = loadGifFrames(from: gifData) {
            imageView.animationImages = images
            imageView.animationDuration = duration
            imageView.animationRepeatCount = 1
            imageView.startAnimating()

            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self.navigateToLogin()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.navigateToLogin()
            }
        }
    }

    private func loadGifFrames(from data: Data) -> ([UIImage], TimeInterval)? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }

        let count = CGImageSourceGetCount(source)
        var images: [UIImage] = []
        var totalDuration: TimeInterval = 0

        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))

                if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
                   let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any] {
                    let frameDuration = (gifProperties[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double)
                        ?? (gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double)
                        ?? 0.1
                    totalDuration += frameDuration
                }
            }
        }

        return images.isEmpty ? nil : (images, totalDuration)
    }

    private func navigateToLogin() {
        let loginVC = LoginMobileVC(nibName: "LoginMobileVC", bundle: nil)
        let nav = UINavigationController(rootViewController: loginVC)
        nav.navigationBar.isHidden = true
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = nav
            window.makeKeyAndVisible()
        } else if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = nav
            window?.makeKeyAndVisible()
        }
    }

}

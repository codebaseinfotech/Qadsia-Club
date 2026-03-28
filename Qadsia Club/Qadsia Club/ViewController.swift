//
//  ViewController.swift
//  Qadsia Club
//
//  Created by Ankit Gabani on 05/02/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupSplashVideo()
    }

    private func setupSplashVideo() {
        guard let videoPath = Bundle.main.path(forResource: "SplashVideo3", ofType: "mp4") else {
            print("❌ Video file not found!")
            navigateToLogin()
            return
        }

        let url = URL(fileURLWithPath: videoPath)
        let playerItem = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: playerItem)
        self.player = player

        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        self.playerLayer = playerLayer

        NotificationCenter.default.addObserver(self,
            selector: #selector(videoDidFinish),
            name: .AVPlayerItemDidPlayToEndTime,
            object: playerItem)

        player.play()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer?.frame = view.bounds
    }

    @objc private func videoDidFinish() {
        navigateToLogin()
    }

    private func navigateToLogin() {
        NotificationCenter.default.removeObserver(self)
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

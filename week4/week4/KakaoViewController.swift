//
//  KakaoViewController.swift
//  week4
//
//  Created by jaegu park on 2022/10/15.
//

import UIKit
import Lottie

class KakaoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let refreshControl = UIRefreshControl()
        
    lazy var lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "refreshIndicator")
        animationView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        let centerX = UIScreen.main.bounds.width / 2
        animationView.center = CGPoint(x: centerX, y: 40)
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingRoomData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoTalkTableViewCell", for: indexPath) as? KakaoTalkTableViewCell else { return UITableViewCell() }
        cell.nameLabel.text = chattingRoomData[indexPath.row].name
        cell.profileImageView.image = chattingRoomData[indexPath.row].profileImage
        cell.lastMessageLabel.text = chattingRoomData[indexPath.row].lastMessage
        
        if let memberCount = chattingRoomData[indexPath.row].memberCount {
            cell.memberCountLabel.text = memberCount
        } else {
            cell.memberCountLabel.isHidden = true
        }
        
        cell.timeLabel.text = chattingRoomData[indexPath.row].time
        cell.messageCountLabel.text = chattingRoomData[indexPath.row].memberCount
        
        if indexPath.row == 0 {
            cell.backgroundColor = .red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @IBOutlet weak var kakaoTalkTableView: UITableView!
    
    func initRefreshControl() {
            refreshControl.addSubview(lottieView)
            refreshControl.tintColor = .clear
            refreshControl.addTarget(
                self,
                action: #selector(refreshTableView(refreshControl:)),
                for: .valueChanged
            )
            kakaoTalkTableView.refreshControl = refreshControl
    }
    
    @objc func refreshTableView(refreshControl: UIRefreshControl) {
            print("????????????!!")
            lottieView.isHidden = false
            lottieView.play()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.lottieView.isHidden = true
                self.lottieView.stop()
                self.kakaoTalkTableView.reloadData()
                refreshControl.endRefreshing()
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoTalkTableView.delegate = self
        kakaoTalkTableView.dataSource = self
        initRefreshControl()
    }
    
    
    let chattingRoomData: [ChattingRoomDataModel] = [
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "iOS ?????????",
                lastMessage: "????????? ???????????????.",
                memberCount: "200",
                time: "?????? 1:05",
                messageCount: "61"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "UMC 3??? ?????????",
                lastMessage: "?????? ?????? ??? ????????????????",
                memberCount: "15",
                time: "?????? 12:31",
                messageCount: "3"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "?????? 12:02",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????1",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????2",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????3",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????4",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????5",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????6",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????7",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????8",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????9",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????10",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????11",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????12",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????13",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            ),
            ChattingRoomDataModel(
                profileImage: UIImage(named: "defaultProfileIcon"),
                name: "??????14",
                lastMessage: "????????? ?????????!!!",
                memberCount: nil,
                time: "??????",
                messageCount: "1"
            )
        ]
}
    
    struct ChattingRoomDataModel {
        let profileImage: UIImage?
        let name: String
        let lastMessage: String
        let memberCount: String?
        let time: String
        let messageCount: String
    }


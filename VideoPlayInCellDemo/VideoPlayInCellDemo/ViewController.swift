//
//  ViewController.swift
//  VideoPlayInCellDemo
//
//  Created by Hardip Kalola on 25/09/18.
//  Copyright © 2018 Hardip Kalola. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    let count = 10
    var arrQuestion = [QuestionCategory]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        let parameters = guestLoginParam(guestId: "123456", vDeviceToken: "123",eDeviceType: "1")
//        callGuestLoginApi(params: parameters)

    }
   /* func guestLoginParam(guestId : String,vDeviceToken : String,eDeviceType : String) -> Dictionary<String,String> {
        
        var requestDictionary : Dictionary<String,String> = Dictionary()
        requestDictionary["guest_id"] = guestId;
        requestDictionary["device_token"] = vDeviceToken
        requestDictionary["device_type"] = eDeviceType
        print(requestDictionary)
        return requestDictionary
    }
    func callGuestLoginApi(params : Dictionary<String, String>) {
        SOService.callAPI(SOAPI.guestLogin(params: params)) { (code, error, result) in
            //print(code, error ?? "", result ?? "")
            if error == nil && code == 1 {
                
                let objUser = BaseModel(json: result!)
                print("Guest Login code->\(String(describing: objUser.responseCode))")
                
                if objUser.responseCode == 200 {
                    print("Guestlogin Response Data->\(objUser.responseData!.dictionaryRepresentation())")
                    let jsonDict = result!.dictionaryObject!["data"]!
                    if (jsonDict as AnyObject).count > 0{
                        print("Json is a Dictionary->\(jsonDict as! [String : Any])")
                        let loginData = LoginData.init(fromDictionary: jsonDict as! [String : Any])
                        print(loginData.name)
                        print(loginData.id)
                        print(loginData.gender)
                        print(loginData.facebook_id)
//                         for i in 0...syncData.questionCategories.count - 1 {
                        UserDefaults.standard.set(loginData.authToken!, forKey: "kAuthKey")
                        let authKey = UserDefaults.standard.value(forKey: "kAuthKey") as! String
                        print("Auth Token->\(authKey)")
                        
                        let params = self.syncDataParam(timeStamp: "0000000000")
                        self.callSyncDataApi(params: params)


                    }
                }

            } else {
            }
        }
    }
    func syncDataParam(timeStamp : String) -> Dictionary<String,String> {
        
        var requestDictionary : Dictionary<String,String> = Dictionary()
        requestDictionary["last_modified_timestamp"] = timeStamp;
        
        print(requestDictionary)
        return requestDictionary
    }
    // MARK: Sync Data API
    func callSyncDataApi(params : Dictionary<String, String>) {
        SOService.callAPI(SOAPI.syncData(params: params)) { (code, error, result) in
            //print(code, error ?? "", result ?? "")
            if error == nil && code == 1 {
                let objUser = BaseModel(json: result!)
                print("SyncData code->\(String(describing: objUser.responseCode))")
                
                if objUser.responseCode == 200 {
                    print("SyncData Response Data->\(objUser.responseData!.dictionaryRepresentation())")
                    //                    print("Json is a Dictionary ", result!["data"])
                    let jsonDict = result!.dictionaryObject!["data"]!
                    if (jsonDict as AnyObject).count > 0{
                        print("Json is a Dictionary->\(jsonDict as! [String : Any])")
                        let syncData = SyncData.init(fromDictionary: jsonDict as! [String : Any])
                        print(syncData.syncLogs[0].lastModifiedTimestamp)
                        print(syncData.questions.count)
                        for i in 0...syncData.storyCategories.count - 1 {
                            let question = syncData.storyCategories[i]
                            self.arrQuestion.append(question)
                            print("arrQuestion count->\(self.arrQuestion.count)")
                        }
                    }
                }
            } else {
            }
        }
    }*/
}
extension ViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoPlayerCell
        
        
        //        let playerItem = AVPlayerItem(url: url!)
        
        //        let playerLayer = AVPlayerLayer(player: player)
        
        if cell.playerView.player == nil {
            let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            let player = AVPlayer(url: url!)
            cell.playerView.playerLayer.player = player
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let tableView = scrollView as? UITableView {
            findCellandPlay(tableView: tableView)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let tableView = scrollView as? UITableView {
            findCellandPlay(tableView: tableView)
        }
    }
    
    func findCellandPlay(tableView: UITableView) {
        for cell in tableView.visibleCells {
            (cell as! VideoPlayerCell).playerView.player?.pause()
            NotificationCenter.default.removeObserver((cell as! VideoPlayerCell).playerView)
        }
        
        let cell = tableView.visibleCells[tableView.visibleCells.count/2] as! VideoPlayerCell
        let indexPath = tableView.indexPathsForVisibleRows![tableView.indexPathsForVisibleRows!.count/2]
        print(indexPath.row)
        cell.playerView.player!.play()
        NotificationCenter.default.addObserver(cell.playerView, selector: #selector(cell.playerView.play), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
}

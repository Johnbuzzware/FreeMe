//
//  UrlHelper.swift
//  Heylo
//
//  Created by Adeel on 07/01/2021.
//  Copyright © 2021 Buzzware. All rights reserved.
//

import UIKit
import AVKit
enum typeOfImage:String{
    case png = ".png"
    case jpg = ".jpg"
    case jpeg = ".jpeg"
}
enum imageFrom:String{
    case front = "front"
    case back = "back"
}
enum FileType: String{
    case none
    case imageFile = "ImageFile"
    case brustGifFile = "BrustGifFile"
    case videoFile = "VideoFile"
    case gifFile = "GifFile"
}
enum ImageExtention:String {
    case JPEG = "JPEG"
    case JPG = "JPG"
    case PNG = "PNG"
    case TIFF = "TIFF"
    case GIF = "GIF"
    case unknown = "unknown"
}
enum VideoExtention:String {
    case WEBM = "WEBM"
    case MPG = "MPG"
    case MP2 = "MP2"
    case MPEG = "MPEG"
    case MPE = "MPE"
    case MPV = "MPV"
    case OGG = "OGG"
    case MP4 = "MP4"
    case M4P = "M4P"
    case M4V = "M4V"
    case AVI = "AVI"
    case WMV = "WMV"
    case MOV = "MOV"
    case QT = "QT"
    case FLV = "FLV"
    case SWF = "SWF"
    case AVCHD = "AVCHD"
    case unknown = "unknown"
    
}
enum RecordingMode : String {
    case photo
    case video
    case gif
    case brust_gif
    case boomring
}
class UrlHelper: NSObject {
    
    static let shared = UrlHelper()
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var documentsDirectory = paths[0] as String
        if let displayname = Bundle.main.displayName{
            documentsDirectory = (paths[0] as NSString).appendingPathComponent(displayname) as String
        }
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: documentsDirectory){
            return documentsDirectory
        }
        else{
            do{
                //let image = try fileManager.contentsOfDirectory(atPath: documentsDirectory)
                try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                return documentsDirectory
            }
            catch{
                print(error)
                return ""
            }
        }
    }
    func tempurl(_ url:URL, _ completion: ((URL?)->())? = nil){
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String
        var tempURL = URL(fileURLWithPath: path)
        // Apend filename (name+extension) to URL
        tempURL.appendPathComponent("neww\(url.lastPathComponent)")
        do {
            // If file with same name exists remove it (replace file with new one)
            if FileManager.default.fileExists(atPath: tempURL.path) {
                try FileManager.default.removeItem(atPath: tempURL.path)
            }
            // Move file from app_id-Inbox to tmp/filename
            // FileManager.default.createFile(atPath: tempURL.path, contents: nil)
            try FileManager.default.moveItem(atPath: url.path, toPath: tempURL.path)
            //   if url.startAccessingSecurityScopedResource() {
            //
            //
            //    //try FileManager.default.moveItem(at: url, to: tempURL.path)
            //   }
            // try FileManager.default.moveItem(atPath: url.path, toPath: tempURL.path)
            if FileManager.default.fileExists(atPath: tempURL.path) {
                print("trueee")
                //try FileManager.default.removeItem(atPath: tempURL.path)
            }
            completion?( tempURL)
        } catch {
            print(error.localizedDescription)
            completion?( nil)
        }
    }
    func getNewDocumentUrl(_ url: URL? = nil,fileType:FileType = .none, _ completion: ((URL?)->())? = nil){
        let fdate = "\(Date().milisecondInt64)"
        if let urlstr = url{
            let paths = ((self.getDirectoryPath(fileType) as NSString).appendingPathComponent(fdate) as NSString).appendingPathExtension(urlstr.pathExtension)
            print(paths)
            do{
                let data = try Data(contentsOf: urlstr)
                FileManager.default.createFile(atPath: paths!, contents: data, attributes: nil)
                let exportUrl: URL = NSURL.fileURL(withPath: paths! as String)
                completion?(exportUrl)
            }
            catch{
                completion?(nil)
            }
        }
        else{
            completion?(nil)
        }
    }
    func getThumbnailImageFromVideoUrl(mediaFile: URL, completion: @escaping ((UIImage?,Error?)->Void)) {
        DispatchQueue.global().async { //1
            let asset = AVAsset(url: mediaFile) //2
            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset) //3
            avAssetImageGenerator.appliesPreferredTrackTransform = true //4
            let thumnailTime = CMTimeMake(value: 2, timescale: 1) //5
            do {
                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil) //6
                let thumbImage = UIImage(cgImage: cgThumbImage) //7
                DispatchQueue.main.async { //8
                    completion(thumbImage,nil) //9
                }
            } catch {
                print(error.localizedDescription) //10
                completion(nil,error)
            }
        }
    }
    func clearCachesDirectory(completion:@escaping((Bool) -> ())){
        let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileManager = FileManager.default
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory( at: cacheURL, includingPropertiesForKeys: nil, options: [])
            for file in directoryContents {
                do {
                    try fileManager.removeItem(at: file)
                    completion(true)
                }
                catch let error as NSError {
                    debugPrint("Ooops! Something went wrong: \(error)")
                    completion(false)
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
            completion(false)
        }
    }
    func saveImageDocumentDirectory(image: UIImage, completion:((_ image: UIImage,_ url: URL )->())? = nil){
        let fileManager = FileManager.default
        let getDate = Date().milisecondInt64
        //let formatter = DateFormatter()
        //formatter.dateFormat = "dd_MM_yyyy_hh_mm_ss"
        //let fdate = formatter.string(from: getDate)
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("\(getDate).png")
        //let image = UIImage(named: fdate + ".jpg")
        print(paths)
        let imageData = image.jpegData(compressionQuality: 0.0)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        let exportUrl: URL = NSURL.fileURL(withPath: paths as String)
        completion?(image,exportUrl)
    }
    func getDirectoryPath(_ fileType:FileType = .none) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var documentsDirectory = paths[0] as String
        if let displayname = Bundle.main.displayName{
            documentsDirectory = (paths[0] as NSString).appendingPathComponent(displayname) as String
        }
        let fileManager = FileManager.default
        switch fileType {
        case .none:
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    //let image = try fileManager.contentsOfDirectory(atPath: documentsDirectory)
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        case .imageFile:
            documentsDirectory = (paths[0] as NSString).appendingPathComponent(fileType.rawValue) as String
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    //let image = try fileManager.contentsOfDirectory(atPath: documentsDirectory)
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        case .videoFile:
            documentsDirectory = (paths[0] as NSString).appendingPathComponent(fileType.rawValue) as String
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    //let image = try fileManager.contentsOfDirectory(atPath: documentsDirectory)
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        case .brustGifFile:
            documentsDirectory = (paths[0] as NSString).appendingPathComponent(fileType.rawValue) as String
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    //let image = try fileManager.contentsOfDirectory(atPath: documentsDirectory)
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        case .gifFile:
            documentsDirectory = (paths[0] as NSString).appendingPathComponent(fileType.rawValue) as String
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    //let image = try fileManager.contentsOfDirectory(atPath: documentsDirectory)
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        default:
            break
        }
    }
}

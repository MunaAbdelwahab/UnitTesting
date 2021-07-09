//
//  ApiClass.swift
//  UnitTestingTasks
//
//  Created by Hala on 22/03/2021.
//

import Foundation

class ApiClass {
    
    private func getData(urlString: String, completion: @escaping (Any?) -> Void ){
        
        let session = URLSession.shared
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!){
            data, response, error in
            
            if error != nil || data == nil{
                print(error!.localizedDescription)
                return
            }
            
            do{
                
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
                completion(json)
                
            }catch{
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
    }
    
    
    func getApiData(urlString: String, completion: @escaping (Any?) -> Void ){
        getData(urlString: urlString, completion: completion)
    }
    
    
}



class ApiMockClass : ApiClass{
    
    override func getApiData(urlString: String, completion: @escaping (Any?) -> Void) {
        
        if let userStub = Bundle.main.url(forResource: "responseStub", withExtension: "json"){
            
            do{
                let data = try! Data(contentsOf: userStub, options: .mappedIfSafe)
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    completion(json)
                }
                
                
            }catch{
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}

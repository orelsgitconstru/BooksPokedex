//
//  LoginViewModel.swift
//  MyBooks
//
//  Created by Orel Zilberman on 24/01/2022.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase


struct LoginViewModel {
    
    
    func login(username: String, password: String) -> Observable<AuthDataResult?> {
        return Observable.create{observer in
            Auth.auth().signIn(withEmail: username, password: password){result, error in
                if(error != nil){
                    observer.onError(error!)
                } else {
                    observer.onNext(result)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
    func register(username: String, password: String) -> Observable<AuthDataResult?>{
        return Observable.create{observer in
            Auth.auth().createUser(withEmail: username, password: password){result, error in
                if(error != nil){
                    observer.onError(error!)
                } else {
                    observer.onNext(result)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
    func loginWithGoogle(){
        //        let signInConfig = GIDConfiguration.init(clientID: Bundle.main.object(forInfoDictionaryKey: Bundle.main.object(forInfoDictionaryKey: <#T##String#>)) as String)
        
        //        Observable.from{
        //            return "hello"
        //        }
    }
    
}

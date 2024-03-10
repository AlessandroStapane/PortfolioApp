//
//  Notifiche.swift
//  Portfolio
//
//  Created by Alessandro Stapane on 20/02/24.
//

import SwiftUI

struct Notifiche: View {
    let notifications = ["Notifica 1", "Notifica 2", "Notifica 3"] // Elenca le tue notifiche qui
    @State private var isHomeActive: Bool = false
    var body: some View {
        NavigationView {
            List(notifications, id: \.self) { notification in
                NavigationLink(destination: NotificationDetail(notification: notification)) {
                    Text(notification)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Notifiche")
            .navigationBarItems(leading: Text(""))
        }
        
               HStack(spacing: 45) {
                   NavigationLink(destination: Home(), isActive: $isHomeActive) {
                       VStack (spacing: 20){
                           Image(uiImage: UIImage(named: "logo")!)
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 50, height: 50)
       
                               .onTapGesture {
                                   guard !isHomeActive else { return }
                                   isHomeActive = true
                               }
                       }
                   }
       
                   NavigationLink(destination: Contatti()) {
                       VStack {
                           Image(systemName: "person.crop.square.fill.and.at.rectangle")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 30, height: 30)
                               .foregroundColor(Color(UIColor { traitCollection in
                                   return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                               }))
                       }
                   }
       
       
                   NavigationLink(destination: Skill()) {
                       HStack(spacing: 0){
                           Image(systemName: "suitcase")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 30, height: 30)
                               .foregroundColor(Color(UIColor { traitCollection in
                                   return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                               }))
                       }
                   }
       
       
                   NavigationLink(destination: Esperienza()) {
                       Image(systemName: "chart.bar.xaxis")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 30, height: 30)
                           .foregroundColor(Color(UIColor { traitCollection in
                               return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                           }))
                   }
                   .navigationBarBackButtonHidden(true)
                   NavigationLink(destination: Proggetti()) {
                       Image(systemName: "folder")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 30, height: 30)
                           .foregroundColor(Color(UIColor { traitCollection in
                               return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                           }))
       
                   }
       
               }
               .frame(alignment: .bottom)
               .padding(.bottom)
       
    }
}

struct NotificationDetail: View {
    let notification: String

    var body: some View {
        Text(notification)
            .navigationTitle("Dettaglio Notifica")
    }
}




//struct Notifiche: View {
//    @State private var isHomeActive: Bool = false
//    var body: some View {
//        
//        
//        
//        
//        
//        HStack(spacing: 45) {
//            NavigationLink(destination: Home(), isActive: $isHomeActive) {
//                VStack (spacing: 20){
//                    Image(uiImage: UIImage(named: "logo")!)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 50, height: 50)
//                    
//                        .onTapGesture {
//                            guard !isHomeActive else { return }
//                            isHomeActive = true
//                        }
//                }
//            }
//      
//            NavigationLink(destination: Contatti()) {
//                VStack {
//                    Image(systemName: "person.crop.square.fill.and.at.rectangle")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(Color(UIColor { traitCollection in
//                            return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
//                        }))
//                }
//            }
//          
//            
//            NavigationLink(destination: Skill()) {
//                HStack(spacing: 0){
//                    Image(systemName: "suitcase")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(Color(UIColor { traitCollection in
//                            return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
//                        }))
//                }
//            }
//   
//            
//            NavigationLink(destination: Esperienza()) {
//                Image(systemName: "chart.bar.xaxis")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(Color(UIColor { traitCollection in
//                        return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
//                    }))
//            }
//            .navigationBarBackButtonHidden(true)
//            NavigationLink(destination: Proggetti()) {
//                Image(systemName: "folder")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(Color(UIColor { traitCollection in
//                        return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
//                    }))
//                  
//            }
//
//        }
//        .frame(alignment: .bottom)
//        .padding(.bottom)
//
//    }
//}

#Preview {
    Notifiche()
}

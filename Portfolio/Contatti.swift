//
//  Contatti.swift
//  Portfolio
//
//  Created by Alessandro Stapane on 16/02/24.
//

import SwiftUI
import MapKit
import UIKit
import MessageUI

struct Contatti: View {
    @State private var isShowingQRCode = false
    @State private var isShowingLocation = false
    @State private var isShowingMap = false
    @State private var isHomeActive: Bool = false
    var body: some View {
        Spacer()
        VStack{
            Grid{
                GridRow {
                    Image(systemName: "person.crop.circle")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(UIColor { traitCollection in
                            return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                        }))
                    Text("Alessandro Stapane")
                        
                        .foregroundColor(Color(UIColor { traitCollection in
                            return traitCollection.userInterfaceStyle == .dark ? UIColor.systemBlue : UIColor.systemBlue
                        }))
                        .onTapGesture{
                            self.isShowingQRCode.toggle()
                        }
                    
                }
                .padding(2)
                GridRow {
                    Image(systemName: "mail")
                        .foregroundColor(Color(UIColor { traitCollection in
                            return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                        }))
                    
                    
                    Link("alessandro.stapane@outlook.com", destination: URL(string: "mailto:alessandro.stapane@outlook.com")!)
                        .foregroundColor(Color(UIColor { traitCollection in
                            return traitCollection.userInterfaceStyle == .dark ? UIColor.systemBlue : UIColor.systemBlue
                        }))
                       
                }
                .padding(10)
                GridRow {
                    Image(systemName: "phone")
                        .foregroundColor(Color(UIColor { traitCollection in
                            return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                        }))
                    
                    Button(action: {
                        let phoneURL = URL(string: "tel://+393338887689")
                        
                    }) {
                        Text("+39 333 888 7689")
                            .foregroundColor(Color(UIColor { traitCollection in
                                return traitCollection.userInterfaceStyle == .dark ? UIColor.systemBlue : UIColor.systemBlue
                            }))
                        
                    }
                }
                .padding(10)
                GridRow {
                    Image(systemName: "location")
                        .foregroundColor(Color(UIColor { traitCollection in
                            return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                        }))
                    Text("Galatone, Lecce, Puglia, Italia")
                        .foregroundColor(Color(UIColor { traitCollection in
                            return traitCollection.userInterfaceStyle == .dark ? UIColor.systemBlue : UIColor.systemBlue
                        }))
                        .onTapGesture{
                            self.isShowingMap.toggle()
                        }
                        
                }
            }
            .padding(.vertical, 4.0)
        }
        .navigationBarTitle("Contatti")
        .navigationBarItems(leading: Text(""))
        .navigationBarBackButtonHidden(true) 
        .sheet(isPresented: $isShowingQRCode) {
            Text("Scansionami per ulteriori informazioni")
                .font(.title2)
            Image(uiImage: UIImage(named: "Untitled")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
        .sheet(isPresented: $isShowingMap) {
           MapView()
        }

       Spacer()
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
        .frame(alignment: .bottom) // Allinea il contenuto del HStack in basso
        .padding(.bottom) // Aggiunge un po' di spazio dal bordo inferiore
    }
}





struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.14713, longitude: 18.06915),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}


struct MessageComposer: UIViewControllerRepresentable {
    let recipients: [String]
    let body: String
    
    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = context.coordinator
        composeVC.recipients = recipients
        composeVC.body = body
        return composeVC
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
        // Nessuna aggiornamento necessario
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            controller.dismiss(animated: true)
        }
    }
}


#Preview {
    Contatti()
}

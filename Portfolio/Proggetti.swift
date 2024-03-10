//
//  Progetti.swift
//  Portfolio
//
//  Created by Alessandro Stapane on 17/02/24.
//

import SwiftUI
import SafariServices

struct Item: View {
    var title: String
    var description: String
    var date: String
    var link: String
    @State private var isShowingDetail = false
    @State private var isHomeActive: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
     
            Text(title)
                .font(.headline)
                .foregroundColor(Color(UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor.yellow : UIColor.black
                }))
            Text(description)
                .font(.subheadline)
                .foregroundColor(Color(UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
                }))
            Text(date)
                .font(.caption)
                .foregroundColor(Color(UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
                }))
            
        }
        .padding()
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .border(Color.gray.opacity(0.5), width: 1)
        .onTapGesture {
            isShowingDetail.toggle()
            
            
        }
        .sheet(isPresented: $isShowingDetail) {
            if link == ""{
                Text("Non è stato possibile caricare la repository in quanto assenete in GitHub, riprova fra qualche giorno")
            }
            else{
                SafariView(url: URL(string: link)!)
            }
           
           // Detail(title: title, description: description, date: date, link: link)
        }
    }
}

struct Proggetti: View {
    @State private var isHomeActive: Bool = false
    
    var body: some View {
        Spacer()
        VStack{
            Item(title: "Portfolio", description: "Creato con HTML5, CSS3 e JS", date: "", link: "https://github.com/AlessandroStapane/Portfolio.git")
            Item(title: "Whether-App", description: "Creato con ReactJS", date: "", link: "https://github.com/AlessandroStapane/Whether-App.git")
            Item(title: "Portfolio iOS", description: "Creato in SwiftUI", date: "", link: "")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Progetti")
        .navigationBarItems(leading: Text(""))
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


#Preview {
    Proggetti()
}

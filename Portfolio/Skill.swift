//
//  Skill.swift
//  Portfolio
//
//  Created by Alessandro Stapane on 17/02/24.
//

import SwiftUI
struct Skill_cost: View {
    let title: String
    let percentage: CGFloat
    let barColor: Color
   
    @State  var displayedPercentage: Int = 0
    
    var body: some View {
        VStack {
            Text(title)
                .padding(.top) // Aggiunge spazio in cima al titolo
                .font(.headline) // Cambia il font del titolo
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: geometry.size.width, height: 10)
                    
                    Rectangle()
                        .foregroundColor(barColor) // Utilizza il colore personalizzato per la barra di avanzamento
                        .frame(width: min(self.percentage * geometry.size.width, geometry.size.width), height: 10)
                }
            }
            .frame(height: 10)
           
            Text("\(Int(round(percentage * 100)))%")
                .font(.caption) // Cambia la dimensione del font della percentuale
                .foregroundColor(.secondary) // Cambia il colore del testo della percentuale
                .transition(.scale) // Aggiungi una transizione per l'animazione del testo
        }
        .padding()
        
        }
    }



struct Skill: View {
    @State private var isAnimating = false
    @State private var isHomeActive: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: -10) {
                Skill_cost(title: "React JS", percentage: 0.2, barColor: .blue)
                Skill_cost(title: ".NET", percentage: 0.4, barColor: .purple)
                Skill_cost(title: "Javascript", percentage: 0.3, barColor: .yellow)
                Skill_cost(title: "CSS3", percentage: 0.5, barColor: .cyan)
                Skill_cost(title: "HTML", percentage: 0.9, barColor: .orange)
                Skill_cost(title: "Jquery", percentage: 0.3, barColor: .indigo)
                Skill_cost(title: "SwiftUI", percentage: 0.2, barColor: .red)
                Skill_cost(title: "Database", percentage: 0.7, barColor: .green)
                Skill_cost(title: "Git", percentage: 0.5, barColor: .gray)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Skill")
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
    Skill()
}

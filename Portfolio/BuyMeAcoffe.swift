import SwiftUI
import WebKit

struct BuyMeACoffeeView: View {
    @State private var isHomeActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                SafariView(url: URL(string: "https://buymeacoffee.com/alessandrostapane")!)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack(spacing: 30) {
                    Spacer()
                    NavigationLink(destination: Home(), isActive: $isHomeActive) {
                        VStack(spacing: 20){
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
                    NavigationLink(destination:BuyMeACoffeeView()) {
                        VStack{
                            Image(uiImage: UIImage(named: "bmc-logo-no-background")!)
                                .resizable()
                                .padding(.top, 1)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                    }
                    Spacer() // Aggiunto Spacer per allineare a destra
                }
                .padding(.bottom, 16) // Aggiunto padding alla parte inferiore della barra di navigazione
                .background(Color(UIColor.systemBackground)) // Colore di sfondo della barra di navigazione
            }
          
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    BuyMeACoffeeView()
}


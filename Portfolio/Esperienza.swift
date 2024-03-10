import SwiftUI
import SafariServices
struct TimelineItem: View {
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
            // Qui inserisci il foglio modale che mostra le informazioni dettagliate
            DetailView(title: title, description: description, date: date, link: link)
        }
    }
}

struct DetailView: View {
    var title: String
    var description: String
    var date: String
    var link: String
    @State private var isShowingWebPage = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()
            Text(description)
                .font(.body)
                .padding()
            Text(date)
                .font(.caption)
                .padding()
            Button("Apri pagina web") {
                isShowingWebPage.toggle()
            }
            .sheet(isPresented: $isShowingWebPage) {
                SafariView(url: URL(string: link)!)
            }
        }
    }
}


struct Esperienza: View {
    @State private var isHomeActive: Bool = false
    var body: some View {
        Spacer()
        VStack{
            
            TimelineItem(title: "SeiConsulting", description: "Junior Developer", date: "Novembre 2021 - Novembre 2023", link: "http://seiconsulting.it/")
            TimelineItem(title: "Splash Parco Acquatico", description: "Operaio", date: "Luglio 2021 - Ottobre 2021", link: "https://www.splashparco.it")
            TimelineItem(title: "I.I. S.S E MEDI GALTONE", description: "Perito informatico", date: "Settembre 2016 - Luglio 2021", link:"https://www.iissmedigalatone.it")
            
        }
        
        .navigationBarTitle("Esperienza")
        .navigationBarItems(leading: Text(""))
        .navigationBarBackButtonHidden(true)
        
        
        
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



struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // Aggiornamenti non necessari
    }
}


#Preview{
    Esperienza()
}

import SwiftUI
import UIKit
import PDFKit
import SafariServices

struct load: View {
    @State private var buttonTapped = false
    
    var body: some View {
        VStack {
            if buttonTapped {
                Home()
            } else {
                TypewriterView()
                
                Button("Clicca qui per il portfolio") {
                    buttonTapped = true
                }
                .padding()
                .hidden()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                        buttonTapped = true
                    }
                }
            }
        }
    }
    
    struct TypewriterView: View {
        @State private var typedText = ""
        @State private var typedText2 = ""
        let Benvenuto = "Ciao 👋🏻 e benvenuto nel mio portfolio!"
        let Motto = "Nulla è impossibile 💪🏻"
        
        var body: some View {
            VStack {
                Text(typedText)
                    .font(.custom("Courier", size: 20))
                    .multilineTextAlignment(.center)
                    .padding()
                    .onAppear {
                        animateTypewriterEffect()
                    }
                
                Text(typedText2)
                    .font(.body)
                    .padding(.top)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            animateTypewriterEffect2()
                        }
                    }
                    .italic()
            }
        }
        
        func animateTypewriterEffect() {
            for (index, character) in Benvenuto.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                    typedText.append(character)
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                }
            }
        }
        
        func animateTypewriterEffect2() {
            for (index, character) in Motto.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                    typedText2.append(character)
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                }
            }
        }
    }
}

struct Home: View {
    @State private var isHomeActive: Bool = false
    @State private var showingDocumentPicker = false
    @State private var pdfData: Data?
    @State private var home: Bool = true
    @State private var isShowingWebPage: Bool = false
    @State private var isShowingInstruction: Bool = false
    @State private var isShowingCoffe: Bool = false
    @State private var buttonTapped = false
    private var doc: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(uiImage: UIImage(named: "bmc-logo-no-background")!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding()
                            )
                            .onTapGesture {
                                isShowingInstruction.toggle()
                            }
                            .sheet(isPresented: $isShowingInstruction) {
                                SafariView(url: URL(string: "https://buymeacoffee.com/alessandrostapane")!)
                            }
                    }
                    .navigationBarBackButtonHidden(true)
                }
                
                Spacer()
                
                Image(uiImage: UIImage(named: "logo")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.bottom)
                    .padding(.bottom)
                
                Text("Ciao sono Alessandro")
                    .font(.title)
                    .padding(.top, 10.0)
                
                Text("Developer")
                    .font(.body)
                    .padding(.top, 0.0)
                    .padding(.bottom, 30.0)
                
                Capsule()
                    .foregroundColor(Color.yellow)
                    .frame(width: 230, height: 40)
                    .scaleEffect(buttonTapped ? 0.95 : 1.0)
                    .overlay(
                        HStack {
                            Text("Visualizza il Curriculum")
                                .foregroundColor(Color(UIColor { traitCollection in
                                    return traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor.black
                                }))
                                .padding(.leading)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        .padding(.trailing, 15)
                        .overlay(
                            VStack {
                                Image(systemName: "arrow.forward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color(UIColor { traitCollection in
                                        return traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor.black
                                    }))
                                    .padding(.trailing, 10)
                            }
                        , alignment: .trailing)
                    )
                    .onTapGesture {
                        isShowingInstruction.toggle()
                    }
                    .sheet(isPresented: $isShowingInstruction) {
                        Text("Per salvare il Curriculum usa \(Image(systemName: "square.and.arrow.up")) e poi scegli Salva su file")
                            .padding(.bottom, 30)
                        Button("Andiamo!") {
                            isShowingWebPage.toggle()
                        }
                        .buttonStyle(FancyButtonStyle())
                        .sheet(isPresented: $isShowingWebPage) {
                            SafariView(url: URL(string: "https://alessandrostapane.github.io/Portfolio/src/assets/Resume/Alessandro_Stapane.pdf")!)
                        }
                    }
                
                Spacer()
                
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
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct FancyButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .foregroundColor(.black)
                .background(Color.yellow)
                .frame(height: 40)
                .cornerRadius(150)
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        }
    }
    
    #Preview{
        load()
    }
}

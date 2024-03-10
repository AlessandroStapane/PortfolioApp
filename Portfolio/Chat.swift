////
////  Chat.swift
////  Portfolio
////
////  Created by Alessandro Stapane on 24/02/24.
////
//
//import SwiftUI
//import MessageUI
//struct Chat: View {
//    @State private var isShowingMessageComposer = false
//    @State private var buttonTapped = false
//    var body: some View {
//        VStack {
//            
//            
//            Button("Contattami") {
//                isShowingMessageComposer.toggle()
//                buttonTapped = true
//            }
//            .padding()
//            .hidden()
//            .onAppear {
//                // Dopo 5 secondi, impostiamo buttonTapped su true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
//                    buttonTapped = true
//                    
//                }
//            }
//            if buttonTapped{
//                
//                MessageComposer(recipients: ["+393338887689"], body: "")
//                
//            }
//        }
//    }
//}
//
//struct MessageComposer: UIViewControllerRepresentable {
//    let recipients: [String]
//    let body: String
//    
//    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
//        let composeVC = MFMessageComposeViewController()
//        composeVC.messageComposeDelegate = context.coordinator
//        composeVC.recipients = recipients
//        composeVC.body = body
//        return composeVC
//    }
//    
//    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
//        // Nessuna aggiornamento necessario
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator()
//    }
//    
//    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
//        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
//            controller.dismiss(animated: true)
//        }
//    }
//}
//#Preview {
//    Chat()
//}

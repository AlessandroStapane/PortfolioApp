//
//  NetAdm.swift
//  Portfolio
//
//  Created by Alessandro Stapane on 22/02/24.
//

import SwiftUI
import SwiftUI
import SystemConfiguration

struct NetAdm: View {
    @State private var isNetworkAvailable = true
    @State private var showingPermissionAlert = false

    var body: some View {
        VStack {
                if isNetworkAvailable {
                    Text("La connessione di rete è disponibile.")
                } else {
                    Text("La connessione di rete non è disponibile.")
                    Button("Abilita rete") {
                        showingPermissionAlert = true
                    }
                }
            }
            .onAppear {
                checkNetworkStatus()
            }
            .alert(isPresented: $showingPermissionAlert) {
                Alert(
                    title: Text("Richiesta di autorizzazione"),
                    message: Text("Per favore, autorizza l'accesso alla rete nelle impostazioni."),
                    primaryButton: .default(Text("Apri impostazioni")) {
                        openSettings()
                    },
                    secondaryButton: .cancel()
                )
            }
        }

        func checkNetworkStatus() {
            let reachability = SCNetworkReachabilityCreateWithName(nil, "example.com")
            var flags = SCNetworkReachabilityFlags()

            if SCNetworkReachabilityGetFlags(reachability!, &flags) {
                isNetworkAvailable = flags.contains(.reachable)
            } else {
                isNetworkAvailable = false
            }
        }

        func openSettings() {
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(settingsURL)
        }
}

#Preview {
    NetAdm()
}

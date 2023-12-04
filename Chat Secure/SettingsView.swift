import SwiftUI
import SafariServices

struct SettingsView: View {
    @State private var notificationsEnabled: Bool = true
    @State private var privacyMode: Bool = false
    @State private var selectedTheme: String = "Light"
    @State private var robotStatus: String = "Active"  // Placeholder value
    @State private var showingInfo: Bool = false
    @State private var infoText: String = ""
    @State private var robotBatteryStatus: Int = 85  // Placeholder value
    @State private var showUserProfileMenu: Bool = false
    @State private var showMusicMenu: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Button("User Profile Settings") {
                    showUserProfileMenu.toggle()
                }
                .sheet(isPresented: $showUserProfileMenu, content: {
                    UserProfileSettingsView()
                })

                Section(header: Text("Robot")) {
                    Text("Robot Status: \(robotStatus)")
                    Text("Battery: \(robotBatteryStatus)%")
                }

                Button("Music Settings") {
                    showMusicMenu.toggle()
                }
                .sheet(isPresented: $showMusicMenu, content: {
                    MusicSettingsView()
                })

                Toggle(isOn: $notificationsEnabled, label: {
                    settingRow(title: "Enable Notifications", info: "Toggle to enable or disable all notifications.")
                })
                .onChange(of: notificationsEnabled) { newValue in
                    updateNotificationSetting(to: newValue)
                }

                Toggle(isOn: $privacyMode, label: {
                    settingRow(title: "Privacy Mode", info: "Toggle to hide sensitive content in previews.")
                })
                .onChange(of: privacyMode) { newValue in
                    updatePrivacyMode(to: newValue)
                }

                Picker("Theme", selection: $selectedTheme) {
                    Text("Light").tag("Light")
                    Text("Dark").tag("Dark")
                }
                .onChange(of: selectedTheme) { newTheme in
                    updateTheme(to: newTheme)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .navigationTitle("Settings")
            .alert(isPresented: $showingInfo, content: {
                Alert(title: Text("App Info"), message: Text(infoText), dismissButton: .default(Text("Close")))
            })
        }
    }

    func settingRow(title: String, info: String) -> some View {
        HStack {
            Text(title)
            Spacer()
            Button(action: {
                infoText = info
                showingInfo.toggle()
            }) {
                Image(systemName: "info.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }

    func updateNotificationSetting(to value: Bool) {
        // Placeholder function to update notification settings.
        print("Notification setting updated to: \(value)")
    }

    func updatePrivacyMode(to value: Bool) {
        // Placeholder function to update privacy mode.
        print("Privacy mode updated to: \(value)")
    }

    func updateTheme(to theme: String) {
        // Placeholder function to update theme.
        print("Theme updated to: \(theme)")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


struct UserProfileSettingsView: View {
    var body: some View {
        List {
            Button("Change Name") {
                // Navigate or execute change name function
            }
            Button("Change Email") {
                // Navigate or execute change email function
            }
            Button("Change Password") {
                // Navigate or execute change password function
            }
            Button("Link/Unlink Apple Sign-In") {
                // Navigate or execute Apple sign-in function
            }
            Button("Link/Unlink Google Sign-In") {
                // Navigate or execute Google sign-in function
            }
        }
        .navigationTitle("User Profile Settings")
    }
}

struct MusicSettingsView: View {
    @State private var showSpotifyLogin = false

    var body: some View {
        List {
            Button("Link Spotify Account") {
                self.showSpotifyLogin = true
            }
            .sheet(isPresented: $showSpotifyLogin) {
                SpotifyLoginView(isPresented: $showSpotifyLogin)
            }
        }
        .navigationTitle("Music Settings")
    }
}

struct SpotifyLoginView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool

    let clientID = "32112967e8a54bdfb1a79eb25f1fc69c"
    let redirectURI = "chatsecure://spotify-callback"
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SpotifyLoginView>) -> SFSafariViewController {
        let url = URL(string: "https://accounts.spotify.com/authorize?client_id=\(clientID)&response_type=code&redirect_uri=\(redirectURI)")!
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = context.coordinator
        return safariVC
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SpotifyLoginView>) {
        // Nothing to update here
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, SFSafariViewControllerDelegate {
        var parent: SpotifyLoginView

        init(_ parent: SpotifyLoginView) {
            self.parent = parent
        }

        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            parent.isPresented = false
        }
    }
}

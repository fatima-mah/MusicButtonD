//
//  ContentView.swift
//
//  Created by Fatemeh Abolhasani on 19/10/25.
//

import SwiftUI
import AVFoundation



struct ContentView: View {
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Music Button Test")
                .font(.title)
                .bold()
            
            Button("Play Music" ) {
                playMusic()
            }
                    .font(.title2)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            
            Button("Pause") {
                player?.pause()
            }
                    .font(.title2)
                    .padding()
                    .frame(width: 200)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
              }
            }
    
    func playMusic() {
        // Print every file inside the app bundle for debugging
        if let bundlePath = Bundle.main.bundlePath as String? {
            print("App bundle path:", bundlePath)
            let fileManager = FileManager.default
            if let items = try? fileManager.contentsOfDirectory(atPath: bundlePath) {
                print("Files in bundle:")
                for item in items {
                    print("  -", item)
                }
            }
        }
        
        guard let url = Bundle.main.url(forResource: "Test", withExtension: "m4a") else {
            print("Music file not found.")
            return
        }
        
        print("Found file: \(url.lastPathComponent)")
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
            print("Now Playing")
        } catch {
            print("Error playing music: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}

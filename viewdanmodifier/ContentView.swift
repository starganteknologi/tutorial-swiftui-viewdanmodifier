//
//  ContentView.swift
//  viewdanmodifier
//
//  Created by fathur rohman on 17/04/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    struct JudulText: View {
        var text: String
        var body: some View {
            Text(text).modifier(Judul())
        }
    }
    
    struct CapsuleText: View {
        var text: String
        var warnaBg : Color
        
        var body: some View {
            Text(text)
            .font(.largeTitle)
            .padding()
            //.foregroundColor(.white)
            .background(warnaBg)
            .clipShape(Capsule())
        }
    }
    
    var body: some View {
        VStack {
            
            LinearGradient(gradient: Gradient(colors: [.yellow,.green]), startPoint: .top, endPoint: .bottomTrailing).frame(width: 200, height: 200)
                .watermarked(with: "Stargan")
            
            Text("Judul dengan extension").sebagaiJudul()
            
            JudulText(text: "Judul dengan custom modifier")
            
            CapsuleText(text: "Pertama kali",warnaBg: .red)
                .foregroundColor(.white)
            CapsuleText(text: "kedua kali",warnaBg: .green)
                .foregroundColor(.yellow)
            CapsuleText(text: "ketiga kali",warnaBg: .black)
                .foregroundColor(.white)
        }
    }
  
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(10)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct Judul: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}


extension View {
    func sebagaiJudul() -> some View {
        modifier(Judul())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

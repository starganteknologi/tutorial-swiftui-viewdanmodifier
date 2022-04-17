//
//  ContentView.swift
//  viewdanmodifier
//
//  Created by fathur rohman on 17/04/22.
//

import SwiftUI

struct ContentView: View {
   
    struct CapsuleText: View {
        var teks: String
        
        var body: some View {
            Text(teks)
                .font(.largeTitle)
                .padding()
                //.foregroundColor(.white)
                .background(.black)
                .clipShape(Capsule())
        }
    }
    
    struct JudulText: View {
        var teks: String
        
        var body: some View {
            Text(teks).modifier(Judul())
        }
    }
    
    var body: some View {
        VStack {
            
            LinearGradient(colors: [.yellow,.green], startPoint: .top, endPoint: .bottomTrailing)
                .frame(width: 200, height: 200)
                .watermarked(with: "Stargan")
            
            Text("Teks dirubah pake ext dengan custom modifier").sebagaiJudul()
            
            JudulText(teks: "custom view dengan custom modifier")
            
            CapsuleText(teks: "Stargan lagi")
                .foregroundColor(.red)
            CapsuleText(teks: "teks 1")
                .foregroundColor(.white)
            CapsuleText(teks: "teks 2")
                .foregroundColor(.yellow)
        }
    }
}

struct Judul: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(.black)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func sebagaiJudul() -> some View {
        modifier(Judul())
    }
}

struct Watermark: ViewModifier {
    var teks: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(teks)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.blue)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(teks: text))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

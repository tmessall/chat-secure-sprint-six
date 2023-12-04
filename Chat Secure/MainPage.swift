//
//  MainPageView.swift
//  project
//
//  Created by Travis Messall on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            HStack{
                Image(systemName: "face.smiling.inverse").font(.system(size: 30))
                    .foregroundColor(.mint)
                Spacer()
                Text("ChatSecure").font(
                    .system(size: 50)).foregroundStyle(.mint)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Label("", systemImage:  "gearshape.2")
                }).tint(.mint).font(.system(size: 30))}
            Image("roboview")
                .padding(.bottom);
            Spacer()
            Text("Welcome, <user>!")
                .foregroundStyle(.mint)
                .font(.system(size: 30))
            Spacer()
            Spacer()
            HStack{
                Spacer()
                HStack{
                Button(action: {
                    
                }, label: {
                    Label("", systemImage:  "bell.fill")
                }).tint(.white).font(.system(size: 50))
                    Button(action: {
                        
                    }, label: {
                        Label("", systemImage:  "bell.slash")
                    }).tint(.white).font(.system(size: 50))
                }.background(Color.gray)
                Spacer()
                Spacer()
                Spacer()
                Button(action: {
                    
                }, label: {
                    Label("", systemImage:  "mic.circle")
                }).tint(.blue).font(.system(size: 50))
                Spacer()
            }
            Spacer()
        }
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}

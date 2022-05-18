//
//  ContentView.swift
//  Test_JSON
//
//  Created by Antonio Emanuele Cutarella on 16/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var ButtonPressUpdate = true
    
    var body: some View {
        VStack{
            Button(){if ButtonPressUpdate == true {ButtonPressUpdate = false}
                else {ButtonPressUpdate = true}}
            label :
            {
                LottieView(name: "blender", loopMode: .loop)
                    .frame(width: 250, height: 250)
            }
            
            Button{
            } label: {
                Image(systemName: "pencil")
                    .dynamicTypeSize(.accessibility5)
                    .foregroundColor(.black)
            }
            .opacity(ButtonPressUpdate ? 0 : 1)
            .disabled(ButtonPressUpdate)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


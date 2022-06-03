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
                //                Rectangle()
                //                    .frame(width: 69, height: 69)
                //                    .position(x: UIScreen.main.bounds.width*0.13, y: UIScreen.main.bounds.height*0.05)
                //                Rectangle()
                //                    .frame(width: 69, height: 69)
                //                    .position(x: UIScreen.main.bounds.width*0.13, y: UIScreen.main.bounds.height*0.05)
                //                Rectangle()
                //                    .frame(width: 69, height: 100)
                //                    .position(x: UIScreen.main.bounds.width*0.13, y: UIScreen.main.bounds.height*0.05)
                //                Rectangle()
                //                    .frame(width: 5, height: 5)
                //                    .position(x: UIScreen.main.bounds.width*0.13, y: UIScreen.main.bounds.height*0.05)
            }
            
            Button{
            } label: {
                Image(systemName: "pencil")
                    .dynamicTypeSize(.accessibility5)
                    .foregroundColor(.black)
                
                
            }
            .opacity(ButtonPressUpdate ? 0 : 1)
            .disabled(ButtonPressUpdate)
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  ButtonDoProccess.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 17/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import SwiftUI

struct ButtonDoProccess: View {
    var message = "Done"
    var body: some View {
        Button(action: {}) {
            Text("\(message)")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 17.0))
        }
        .frame(width: 374, height: 50)
        .background(Color("Hijau"))
        .shadow(color: Color("ShadowHijau"), radius: 10, x: 0, y: 5)
        .cornerRadius(7.0)
    }
}

struct ButtonDoProccess_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDoProccess()
    }
}

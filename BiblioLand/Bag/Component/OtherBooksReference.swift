//
//  OtherBooksReference.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 17/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import SwiftUI

struct OtherBooksReference: View {
    var body: some View {
        VStack{
            Image("Book2")
                .resizable()
                .frame(width: 108, height: 162)
            VStack(spacing: 10) {
                Text("The King of Drugs")
                    .font(.footnote)
                    .lineLimit(nil)
                    .frame(width: 108, height: 37, alignment: .leading)
                Text("Rp. 1.000/day")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .lineLimit(nil)
                    .frame(width: 108, height: 18, alignment: .leading)
                Button(action: {
                    print("Tap button")
                }) {
                    Text("Add to Bag")
                        .foregroundColor(Color.white)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .frame(width: 108, height: 27)
                .background(Color("Merah"))
                .cornerRadius(7.0)
            }
        }
    }
}

struct OtherBooksReference_Previews: PreviewProvider {
    static var previews: some View {
        OtherBooksReference()
    }
}

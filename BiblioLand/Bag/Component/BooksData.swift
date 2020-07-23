//
//  BooksData.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 17/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import SwiftUI

struct BooksData: View {
    var borrower = "Dicky"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
            .fill(Color.white)
            .shadow(radius: 2)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Borrow From")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    Text("\(borrower)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                HStack {
                    Image("Buku")
                        .resizable()
                        .frame(width: 40, height: 60)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Alice's Wonderfull")
                            .fontWeight(.regular)
                            .font(.system(size: 15.0))
                        Text("Price: Rp. 1000/day")
                            .foregroundColor(Color.gray)
                            .fontWeight(.regular)
                            .font(.system(size: 15.0))
                        Text("Book Deposit: Rp. 20.000")
                            .foregroundColor(Color.gray)
                            .fontWeight(.regular)
                            .font(.system(size: 15.0))
                    }
                    .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: "trash")
                        .font(.system(size: 17, weight: .semibold))
                }
                .padding(.horizontal, 10)
            }
            .padding(.horizontal, 10)
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .edgesIgnoringSafeArea(.all)
        .frame(width: 362, height: 120)
    }
}

struct BooksData_Previews: PreviewProvider {
    static var previews: some View {
        BooksData()
    }
}

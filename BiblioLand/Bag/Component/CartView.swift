//
//  CartView.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 17/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit
import SwiftUI

struct CartView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UINavigationBar.appearance().tintColor = .white
    }
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        VStack {
            List {
                Section {
                    BooksData()
                }
                .listRowInsets(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 0))
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .foregroundColor(Color("ShadowHijau"))
            })
            .navigationBarTitle("Bag")
        }
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
        
            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
        }))
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

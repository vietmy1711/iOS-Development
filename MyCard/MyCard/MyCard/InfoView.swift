//
//  InfoView.swift
//  MyCard
//
//  Created by MM on 4/6/20.
//  Copyright © 2020 MM. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var text: String
    var imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(.green)
                Text(text).foregroundColor(.black)
                
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "123", imageName: "phone.fill").previewLayout(.sizeThatFits)
    }
}

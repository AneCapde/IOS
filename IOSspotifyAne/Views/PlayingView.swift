//
//  PlayingView.swift
//  IOSspotifyAne
//
//  Created by Ane Capdevila on 17/11/2021.
//

import SwiftUI

struct PlayingView: View {
    var body: some View {
        AlbumImage()
    }
}

struct AlbumImage:View {
    var body: some View {
    Image("cover_1")
         .resizable()
         .aspectRatio(contentMode: .fill)
         .frame(width: 250.0, height: 250.0, alignment: .center)
         .border(Color.blue, width: 3.0)
         .clipped()
    }
}
struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingView()
    }
}

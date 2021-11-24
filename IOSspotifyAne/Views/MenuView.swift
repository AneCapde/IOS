//
//  MenuView.swift
//  IOSspotifyAne
//
//  Created by Ane Capdevila on 17/11/2021.
//

import SwiftUI

struct MenuView: View {
    @State private var currentAlbum : Album?
    
    var albums: [Album] = [Album(id: 0, name: "1", image: "cover_1", songs: [Song(id: 0, name: "song1", time: "2:36")]),
                           Album(id: 1, name: "2", image: "cover_2", songs: [Song(id: 0, name: "song2", time: "2:36")])
                           
    ]
        
    var body: some View {
        ScrollView{
            ScrollView(.horizontal, showsIndicators: false, content: {
                LazyHStack {
                    ForEach(self.albums, id:\.self, content: {
                        album in
                        AlbumArt(album: album).onTapGesture{
                            self.currentAlbum = album
                        }
                    })
                }
            })
        }
        LazyVStack {
            ForEach((self.currentAlbum?.songs ?? self.albums.first?.songs) ?? [Song(id: 0, name: "song1", time: "2:36")] , id:\.self, content: {
                song in SongCell(song: song)
            })
        }
    }
}

struct AlbumArt: View {
    var album : Album
    var body: some View {
        ZStack(alignment: .bottom, content: {
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200, alignment: .center)
            ZStack{
                Blur(style: .dark)
                Text(album.name).foregroundColor(.white)
            }.frame(height: 60, alignment: .center)
        }).frame(width: 170, height: 200, alignment: .center)
        .clipped().cornerRadius(20).shadow(radius: 10).padding(20)
    }
}

struct SongCell: View {
    var song : Song
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.blue)
                Circle()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.white)
                
            }
            Text(song.name).bold()
            Spacer()
            Text(song.time)
        }.padding(20)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

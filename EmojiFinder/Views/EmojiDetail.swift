//
//  EmojiDetail.swift
//  EmojiFinder
//
//  Created by Aditya Himawan on 26/01/24.
//

import SwiftUI

struct EmojiDetail: View {
    let emoji: Emoji
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    EmojiImageView(emoji: emoji)
                    
                    VStack(alignment:.leading, spacing: 20) {
                        Text("Emoji Name : \(emoji.name)")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(emoji.description)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .leading)
                    
                    EmojiFacts()
                        .padding()
                }
                .navigationTitle("\(emoji.name) \(emoji.emoji)")
                .navigationBarTitleDisplayMode(.inline)
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    EmojiDetail(emoji: Emoji.emojiPreviewData[1])
}

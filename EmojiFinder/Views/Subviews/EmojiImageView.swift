//
//  EmojiImageView.swift
//  EmojiFinder
//
//  Created by Aditya Himawan on 26/01/24.
//

import SwiftUI

struct EmojiImageView: View {
    var emoji: Emoji
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            ColorUtility.randomColor()
            Text(emoji.emoji)
                .font(.system(size: 224))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 6, y: 8)
                .scaleEffect(isAnimating ? 1.0 : 0.6)
        }
        .frame(height: 440)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    EmojiImageView(emoji: Emoji.emojiPreviewData[1])
}

//
//  EmojiRow.swift
//  EmojiFinder
//
//  Created by Aditya Himawan on 25/01/24.
//

import SwiftUI

struct EmojiRow: View {
    var emoji: Emoji
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            Text(emoji.emoji)
                .font(.largeTitle)
                .padding()
                .frame(width: 80, height: 80)
                .background(ColorUtility.randomColor())
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(emoji.name)
                    .font(.system(.headline, design: .rounded))
                
                Text(emoji.description)
                    .font(.system(.subheadline, design: .rounded))
                    .lineLimit(3)
            }
        }
    }
}

#Preview {
    EmojiRow(emoji: Emoji.emojiPreviewData[0])
}

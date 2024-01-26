//
//  EmojiFinder.swift
//  EmojiFinder
//
//  Created by Aditya Himawan on 25/01/24.
//

import SwiftUI

struct EmojiFinder: View {
    @State private var emojis: [Emoji] = EmojiProvider.allEmojis()
    @State private var searchText: String = ""
    @State private var isRedacted: Bool = true
    
    // This declares a private var an array of Emoji objects.
    private var emojiDataResults: [Emoji] {
        // This guard clause checks if the searchText variable is empty. If it is empty, it returns the entire emojis array without filtering, as there's nothing to search for
        guard !searchText.isEmpty else { return emojis }
        
        // if not empty
        // This applies the filter method to the emojis array.
        //  .name: Accesses the name property of the current Emoji object.
        //  contains(searchText.lowercased()): Checks if the lowercased name contains the lowercased searchText. If it does, the Emoji object is kept in the filtered results.
        return emojis.filter {
            $0.name
                .lowercased()
                .contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            List(emojiDataResults) { place in
                NavigationLink {
                    EmojiDetail(emoji: place)
                } label: {
                    if isRedacted {
                        EmojiRow(emoji: place)
                            .redacted(reason: .placeholder)
                    } else {
                        EmojiRow(emoji: place)
                    }
                }
            }
            .listRowSeparator(.visible)
            .navigationTitle("Emoji Finder")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(
                    displayMode: .always
                ),
                prompt: "What emoji's that you're looking for?"
            )
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isRedacted = false
                }
            }
            .refreshable {
                addNewEmojiRow()
            }
        }
    }
    
    // Declare provate funtion to Add new Emoji
    private func addNewEmojiRow() {
        // isRedacted = true: This sets a boolean variable isRedacted to true. This likely indicates that the emoji data is temporarily hidden or obscured for visual effect.
        isRedacted = true
        // his retrieves the second emoji preview data (index 1) from the Emoji.emojiPreviewData array
        let newEmojiRow = Emoji.emojiPreviewData[1]
        // This inserts the fetched newEmojiRow data into the emojis array at the beginning (index 0)
        emojis.insert(newEmojiRow, at: 0)
        
        // This schedules a block of code to be executed on the main thread after a delay of 3 seconds and sets the isRedacted variable to false.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            isRedacted = false
        }
    }
}

#Preview {
    EmojiFinder()
}

//
//  EmojiFacts.swift
//  EmojiFinder
//
//  Created by Aditya Himawan on 26/01/24.
//

import SwiftUI

struct EmojiFacts: View {
    let emojiFacts: [String] = [
        "Emoji pertama kali muncul pada tahun 1999 di Jepang.",
        "Ada lebih dari 3000 emoji yang resmi diakui.",
        "Emoji 'wajah tersenyum dengan mata tertawa' adalah salah satu yang paling populer.",
        "Banyak emoji memiliki variasi warna kulit.",
        "Emoji bisa berbeda tampilannya di berbagai platform dan perangkat.",
        "Ada hari Emoji Sedunia yang dirayakan setiap tanggal 17 Juli.",
        "Beberapa emoji dihapus karena kontroversi atau jarang digunakan.",
        "Emoji terus berkembang dengan menambahkan simbol-simbol baru setiap tahunnya."
    ]
    
    var body: some View {
        GroupBox {
            DisclosureGroup("Fakta Menarik tentang Emoji") {
                Divider()
                
                ForEach(emojiFacts, id: \.self) { item in
                    HStack(spacing: 8) {
                        Image(systemName: "info.circle")
                        Spacer(minLength: 5)
                        
                        VStack(alignment: .leading) {
                            Text(item)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }
                        .frame(maxWidth: 640, alignment: .leading)
                    }
                    Divider()
                }
            }
        }
    }
}

#Preview {
    EmojiFacts()
}

//
//  ContentView.swift
//  authorsPhrases
//
//  Created by levi on 11/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var quoteData : QuoteData?
    
    var body: some View {
        Text("authorsPhrases")
            
    }
    private func loadData() {
        guard let url = URL(string: "https://programming-quotes-api.herokuapp.com/quotes/random") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            if let decodeData = try? JSONDecoder().decode (QuoteData.self, from: data) {
                DispatchQueue.main.async {
                    self.quoteData = decodeData
                }
            }
            
        }
    }
}

//Se agrego un struct para añadir los datos de los autores
struct QuoteData : Decodable {
    var _id : String
    var en : String
    var author : String
    var id : String
  }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

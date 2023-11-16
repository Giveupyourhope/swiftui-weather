//
//  ContentView.swift
//  sample-weather
//
//  Created by saeid on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    init(){
        self.viewModel = WeatherViewModel()
    }
    var body: some View {
        VStack {
            
            if self.viewModel.isRainyMode {
                Image(systemName: "cloud.rain.fill")
                    .offset(y: -200)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            
            TextField("Enter City Name", text: self.$viewModel.city){
                self.viewModel.search()
            }
            .font(.title)
            .padding()
            .fixedSize()
            
            if self.viewModel.loading {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                
            }else{
                Text(self.viewModel.temeture)
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(.blue)
    }
}

#Preview {
    ContentView()
}

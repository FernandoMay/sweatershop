//
//  Homie.swift
//  sweatershop (iOS)
//
//  Created by Fernando May on 20/08/22.
//

import SwiftUI

struct Homie: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    var body: some View {
        NavigationView{
        ScrollView{
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(productList, id: \.id){
                    product in
                    ProductCard(product: product)
                        .environmentObject(cartManager)
                }
            }.padding()
        }
        .navigationTitle(Text("Sweater Shop"))
        .toolbar{
            NavigationLink{
                CartView().environmentObject(cartManager)
            } label: {
                CartButton(numberOfProducts: cartManager.products.count)}
        }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Homie_Previews: PreviewProvider {
    static var previews: some View {
        Homie()
    }
}

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                Image(product.image).resizable()
                    .cornerRadius(20)
                    .frame(width: 180, height: 250)
                VStack(alignment: .leading){
                    Text(product.name).bold()
                    Text("\(product.price)$")
                        .font(.caption)
                }.padding()
                    .frame(width: 180,alignment: .leading).background(.ultraThinMaterial).cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            Button{
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

struct CartButton: View {
    var numberOfProducts: Int
    
    var body: some View{
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart").padding(.top,5).foregroundColor(.black)
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }
    }
}

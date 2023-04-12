//
//  AppereanceColorView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 04.04.23.
//

import SwiftUI



struct AppearanceColorsView: View {
    // appearanceIds speichert alle verfügbaren Aussehen-IDs des Produkts.
    let appearanceIds: [Int]
    
    
    // Das ProductDetailViewModel-Objekt wird mithilfe der @EnvironmentObject-Eigenschaft injiziert.
    // Es wird verwendet, um die Farben der Aussehen-IDs des Produkts zu erhalten und das ausgewählte Aussehen-Objekt zu aktualisieren.
    @EnvironmentObject var productVM: ProductDetailViewModel
    
    // selectedColorId ist eine optionale Variable, die das ausgewählte Aussehen-Objekt speichert.
    @State private var selectedColorId: Int?
    
    @State var buttonSize : CGFloat = 40
    
    // Die columns-Eigenschaft definiert die Anzahl der Spalten und den Spacing-Wert.
    let columns = [GridItem(.adaptive(minimum: 40), spacing: 8, alignment: .center)]
    
    var body: some View {
        
        VStack {
            // Füge einen Text hinzu.
            Text("Wähle deine Farbe aus:")
                .foregroundColor(.white)
                .padding(.horizontal, 48 )
                .padding(.vertical, 16)
        } // VStack
        // Setze den Hintergrund mit einer Kapselform und einem Farbverlauf.
        .background(LinearGradient(colors: [.gradientGray, .clear], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
        .shadow(color: .black.opacity(0.6), radius: 10, x:5, y: 20)
        
        ScrollView(.horizontal, showsIndicators: true) {
            Spacer()
            // Eine LazyHGrid-Ansicht wird erstellt, um die Buttons anzuzeigen.
            // Es wird die Anzahl der Spalten und das Spacing definiert.
            LazyHGrid(rows:  [GridItem(.flexible(minimum: 40, maximum: 40), spacing: 16)], alignment: .center) {
                
                // Für jede Aussehen-ID des Produkts wird ein Button erstellt.
                ForEach(appearanceIds, id: \.self) { appearanceId in
                    // Die Farbe des Aussehen-Objekts wird mithilfe des productVM-Objekts abgerufen.
                    if let color = productVM.getColorForProductAppearanceId(appearanceId) {
                        // Wenn der Button gedrückt wird, wird das ausgewählte Aussehen-Objekt aktualisiert.
                        Button(action: {
                            selectedColorId = appearanceId
                            productVM.updateProductAppearanceId(appearanceId)
                            print("Button PRESSED aID: \(appearanceId)")
                            
                            
                            
                        }) {
                            ZStack {
                                // Der Button-Hintergrund ist ein Kreis, dessen Farbe das Aussehen-Objekt entspricht.
                                
                                Circle()
                                    .fill(color)
                                    .frame(width: buttonSize, height: buttonSize)
                                    .shadow(color: .black.opacity(0.4), radius: 10, x:0, y: 10)
                                    .padding(.horizontal, -2)
                                
                                // Wenn das Aussehen-Objekt das ausgewählte Objekt ist, wird ein weißer Kreis um den Button gezeichnet.
                                if selectedColorId == appearanceId {
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .frame(width: 50, height: 50)
                                        .shadow(color: .black.opacity(0.6), radius: 10, x:0, y: 20)
                                        .padding(.horizontal, -8)
                                    
                                }
                            } // ZStack
                            
                        }
                        // Wenn der Button lange gedrückt wird, wird keine Aktion ausgeführt.
                        .onLongPressGesture(minimumDuration: 0.1) {
                        }
                        // Wenn der Button erscheint, wird das Aussehen-Objekt in der Konsole ausgegeben.
                        .onAppear{
                            print("SELECTEDCOLOR: \(appearanceId)")
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                        // Die LazyHGrid-Ansicht wird gepaddet und auf die gesamte verfügbare Größe ausgerichtet.
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
            } // LazyHGrid
            // LazyVGrid
        } // ScrollView
        .scrollIndicators(.visible)
        .background( Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.gradientGray, Color.clear]),
                    startPoint: .trailing,
                    endPoint: .leading
                )
            )
                .padding(.vertical,-8)
                .edgesIgnoringSafeArea(.horizontal))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.6), radius: 10, x:5, y: 20)
        
    }
    
}



struct AppereanceColorView_Previews: PreviewProvider {
    static var previews: some View {
        let spd = PreviewDummieCode()
        AppearanceColorsView(appearanceIds: [0])
    }
}

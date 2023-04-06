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
    
    // selectedSellable speichert das ausgewählte Sellable-Objekt.
    var selectedSellable: Sellable
    
    // Das ProductDetailViewModel-Objekt wird mithilfe der @EnvironmentObject-Eigenschaft injiziert.
    // Es wird verwendet, um die Farben der Aussehen-IDs des Produkts zu erhalten und das ausgewählte Aussehen-Objekt zu aktualisieren.
    @EnvironmentObject var productVM: ProductDetailViewModel
    
    // isPressed ist ein Boolescher Wert, der den Druckstatus des Buttons speichert.
    // selectedColorId ist eine optionale Variable, die das ausgewählte Aussehen-Objekt speichert.
    @State private var isPressed: Bool = false
    @State private var selectedColorId: Int? = nil
    
    // Die columns-Eigenschaft definiert die Anzahl der Spalten und den Spacing-Wert.
    let columns = [GridItem(.adaptive(minimum: 40), spacing: 8)]
    
    var body: some View {
        VStack {
            // Eine LazyVGrid-Ansicht wird erstellt, um die Buttons anzuzeigen.
            // Es wird die Anzahl der Spalten und das Spacing definiert.
            LazyVGrid(columns: columns, spacing: 8) {
                // Für jede Aussehen-ID des Produkts wird ein Button erstellt.
                ForEach(appearanceIds, id: \.self) { appearanceId in
                    // Die Farbe des Aussehen-Objekts wird mithilfe des productVM-Objekts abgerufen.
                    if let color = productVM.getColorForProductAppearanceId(appearanceId) {
                        // Wenn der Button gedrückt wird, wird das ausgewählte Aussehen-Objekt aktualisiert.
                        Button(action: {
                            selectedColorId = appearanceId
                            productVM.updateProductAppearanceId(appearanceId)
                            print("Button PRESSED aID: \(productVM.updateProductAppearanceId(appearanceId))")
                           
                        }) {
                            ZStack {
                                // Der Button-Hintergrund ist ein Kreis, dessen Farbe das Aussehen-Objekt entspricht.
                                Circle()
                                    .fill(color)
                                    .frame(width: 40, height: 40)
                                
                                // Wenn das Aussehen-Objekt das ausgewählte Objekt ist, wird ein weißer Kreis um den Button gezeichnet.
                                if selectedColorId == appearanceId {
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .frame(width: 40, height: 40)
                                }
                            }
                        }
                        // Wenn der Button lange gedrückt wird, wird keine Aktion ausgeführt.
                        .onLongPressGesture(minimumDuration: 0.1) {
                        }
                        // Wenn der Button erscheint, wird das Aussehen-Objekt in der Konsole ausgegeben.
                        .onAppear{
                            print("SELECTEDCOLOR: \(appearanceId)")
                            
                        }
                    }
                }
            }
            // Die LazyVGrid-Ansicht wird gepaddet und auf die gesamte verfügbare Größe ausgerichtet.
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}



struct AppereanceColorView_Previews: PreviewProvider {
    static var previews: some View {
        let spd = PreviewDummieCode()
        AppearanceColorsView(appearanceIds: [1], selectedSellable: spd.sellablePD)
    }
}

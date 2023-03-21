//
//  GRAVEYARD.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation

//Debugging
//    func fetchSellables() {
//        guard let url = URL(string: "https://api.spreadshirt.net/api/v1/shops/100247767/sellables?page=0&SprdAuth%20apiKey=%22b1271341-2d14-468b-a6ed-d28ba13034c0%22") else {
//            print("Falsche URL")
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Fehler beim Abrufen der Daten: \(error.localizedDescription)")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                print("Ungültige HTTP-Antwort")
//                return
//            }
//
//            switch httpResponse.statusCode {
//            case 200:
//                guard let data = data else {
//                    print("Keine Daten in der Antwort")
//                    return
//                }
//
//                do {
//                    let sellables = try JSONDecoder().decode([Sellable].self, from: data)
//                    DispatchQueue.main.async {
//                        self.sellablesList = sellables
//                    }
//                } catch {
//                    print("Fehler beim Dekodieren der Daten: \(error.localizedDescription)")
//                }
//
//            default:
//                print("Ungültiger HTTP-Statuscode: \(httpResponse.statusCode)")
//            }
//        }
//
//        task.resume()
//    }

//    func fetchSellables() {
//        guard let url = URL(string: "https://api.spreadshirt.net/api/v1/shops/100247767/sellables?page=0&SprdAuth%20apiKey=%22b1271341-2d14-468b-a6ed-d28ba13034c0%22") else {
//            print("Falsche URL")
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Fehler beim Abrufen der Daten: \(error.localizedDescription)")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                print("Ungültige HTTP-Antwort")
//                return
//            }
//
//            switch httpResponse.statusCode {
//            case 200:
//                guard let data = data else {
//                    print("Keine Daten in der Antwort")
//                    return
//                }
//                print(String(data: data, encoding: .utf8) ?? "Ungültige Daten")
//                do {
//                    let sellables = try JSONDecoder().decode([Sellable].self, from: data)
//                    DispatchQueue.main.async {
//                        self.sellablesList = sellables
//                    }
//                } catch {
//                    print("Fehler beim Dekodieren der Daten: \(error.localizedDescription)")
//                }
//
//            default:
//                print("Ungültiger HTTP-Statuscode: \(httpResponse.statusCode)")
//            }
//        }
//
//        task.resume()
//    }


//    func fetchSellables() {
//        guard let url = URL(string: "https://api.spreadshirt.net/api/v1/shops/100247767/sellables?page=0&SprdAuth%20apiKey=%22b1271341-2d14-468b-a6ed-d28ba13034c0%22") else {
//            print("FALSCHE URL")
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                print("Keine Daten response: \(error?.localizedDescription ?? "UNBEKANNTER FEHLER")")
//                return
//            }
//
//            do {
//                let sellables = try JSONDecoder().decode([Sellable].self, from: data)
//                DispatchQueue.main.async {
//                    self.sellablesList = sellables
//                }
//            } catch {
//                print("___________nix läuft___________")
//                print("FEHLGESCHLAGEN: JSON dekodieren von DATA!!!")
//                print("IRGENDEIN FEHLER: \(error)")
//                print("VON DATA ERHALTEN: \(data)")
//                print("DIE RESPONSE: \(String(describing: response))")
//            }
//        }
//
//        task.resume()
//    }

//func fetchSellables(from url: URL) -> Void {
//
//    // Erstellen einer URLSessionDataTask, um Daten von der angegebenen URL abzurufen
//    let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) {data, response, error in
//
//        // Überprüfen, ob bei der Anfrage ein Fehler aufgetreten ist
//        if let error = error {
//            DispatchQueue.main.async {
//                // Fehler auf dem Haupt-Thread setzen, um sicherzustellen, dass die Benutzeroberfläche aktualisiert wird
//                self.error = error
//            }
//            return
//        }
//
//        // Überprüfen, ob Daten vorhanden sind
//        guard let data = data else {
//            DispatchQueue.main.async {
//                // Fehler auf dem Haupt-Thread setzen, um sicherzustellen, dass die Benutzeroberfläche aktualisiert wird
//                self.error = NSError(domain: "SellablesListViewModel", code: 1, userInfo: [NSLocalizedDescriptionKey: "No data returned"])
//            }
//            return
//        }
//
//        // Versuchen, die Daten zu decodieren
//        do {
//            let sellables = try JSONDecoder().decode([SellableViewModel].self, from: data)
//            DispatchQueue.main.async {
//                // Die Liste der decodierten Sellables auf dem Haupt-Thread setzen, um sicherzustellen, dass die Benutzeroberfläche aktualisiert wird
//                self.theSellablesListFromVM = sellables
//            }
//        } catch {
//            DispatchQueue.main.async {
//                // Fehler auf dem Haupt-Thread setzen, um sicherzustellen, dass die Benutzeroberfläche aktualisiert wird
//                self.error = error
//
//            }
//        }
//    }
//
//    // Anfrage starten
//    task.resume()
//}

//func fetchSellables() {
  // let url = URL(string: Constants.BASE_URL)!
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        if let data = data {
//            if let decodedResponse = try? JSONDecoder().decode(SellableResponse.self, from: data) {
//                DispatchQueue.main.async {
//                    self.theSellablesListFromVM = decodedResponse.sellables.map { SellableViewModel(sellableResponse: decodedResponse, sellable: $0) }
//                }
//            }
//
//        } else {
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }
//    }.resume()
//}

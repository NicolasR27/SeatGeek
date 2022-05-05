
import SwiftUI
import Combine

class EventsViewModel: ObservableObject {
    @Published var events:[Event] = [Event]()
        
    func search(_ query: String = "") {
        WebService().events(searchQuery: query) { result in
            switch result {
            case let .success(events):
                print(events)
                self.events = events
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}

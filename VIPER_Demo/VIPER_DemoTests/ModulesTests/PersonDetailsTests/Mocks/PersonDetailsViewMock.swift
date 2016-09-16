import Foundation

@testable import VIPER_Demo

class PersonDetailsViewMock : PersonDetailsView {
    var calledDisplayWithPerson: PersonDetailsDataModel? = nil

    func display(person: PersonDetailsDataModel) {
        calledDisplayWithPerson = person
    }
}
import Foundation

protocol PersonDetailsInteractorType {
    var output: PersonDetailsPresenterType { get }
    var service: PeopleServiceType { get }
}

class PersonDetailsInteractor : PersonDetailsInteractorType, PersonDetailsInteractorInput {
    let output: PersonDetailsPresenterType
    let service: PeopleServiceType

    init(output: PersonDetailsPresenterType, peopleService: PeopleServiceType) {
        self.output = output
        self.service = peopleService
    }

    func getPersonBy(id id: Int) {
        service.getPersonByID(withID: id) { [weak self] person in
            guard let strongSelf = self,
            output = strongSelf.output as? PersonDetailsPresenter else { return }
            output.got(person: person)
        }
    }
}
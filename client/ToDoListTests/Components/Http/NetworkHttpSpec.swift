import Quick
import Nimble
@testable import ToDoList

class NetworkHttpSpec: QuickSpec {
    override func spec() {
        describe("http get requests") {
            it("makes a request to the correct endpoint") {
                let spyNetworkSession = SpyNetworkSession()
                let networkHttp = NetworkHttp(networkSession: spyNetworkSession)


                let _ = networkHttp.get(url: "http://www.google.com")


                expect(spyNetworkSession.dataTask_argument_request?.url?.absoluteString)
                    .to(equal("http://www.google.com"))
            }
            
            it("resolves the request with response data") {
                let fakeNetworkSession = FakeNetworkSession()
                let networkHttp = NetworkHttp(networkSession: fakeNetworkSession)
                
                let responseData = "Test Response".data(using: String.Encoding.utf8)
                fakeNetworkSession.dataTask_completionHandler_inputs = (
                    maybeData: responseData,
                    maybeResponse: nil,
                    maybeError: nil
                )
                
                
                let maybeResponseFuture = networkHttp.get(url: "http://www.google.com")
                
                var actualData: Data?
                maybeResponseFuture.onSuccess { data in
                    actualData = data
                }

                
                expect(actualData).toEventually(equal(responseData))
            }
        }
    }
}

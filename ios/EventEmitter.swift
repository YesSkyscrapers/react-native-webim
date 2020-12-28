class EventEmitter {

    /// Shared Instance.
    public static var sharedInstance = EventEmitter()

    // RnWebim is instantiated by React Native with the bridge.
    private static var eventEmitter: RnWebim!

    private init() {}

    // When React Native instantiates the emitter it is registered here.
    func registerEventEmitter(eventEmitter: RnWebim) {
        EventEmitter.eventEmitter = eventEmitter
    }

    func dispatch(name: String, body: Any?) {
        EventEmitter.eventEmitter.sendEvent(withName: name, body: body)
    }

    /// All Events which must be support by React Native.
    lazy var allEvents: [String] = {
        var allEventNames: [String] = []
        
        allEventNames.append("messageAdded");
        allEventNames.append("messageRemoved");
        allEventNames.append("messageChanged");
        allEventNames.append("allMessagesRemoved");
        
        return allEventNames
    }()

}

import Foundation

class DataManager: NSObject {
    
    // MARK: - Singleton
    static var standard = DataManager()
    
    // MARK: - Saved Client id
    @Storage(key: "client_id", defaultValue: "NULL")
    var client_id: String
    
    // MARK: - Setter Client id
    func setClient_id(client_id: String) {
        self.client_id = client_id
    }
    
    // MARK: - Getter Client id
    func getClient_id() -> String {
        return self.client_id
    }
    
    
    // MARK: - Saved Token
    @Storage(key: "token", defaultValue: "NULL")
    var token: String
    
    // MARK: - Setter Token
    func setToken(token: String) {
        self.token = token
    }
    
    // MARK: - Getter Token
    func getToken() -> String {
        return self.token
    }
    
    
    
    
    // MARK: - Saved user_id
    @Storage(key: "user_id", defaultValue: "NULL")
    var user_id: String
    
    // MARK: - Setter user_id
    func setUser_id(user_id: String) {
        self.user_id = user_id
    }
    
    // MARK: - Getter user_id
    func getUser_id() -> String {
        return self.user_id
    }
    
    
    
    
    // MARK: - Saved login
    @Storage(key: "login", defaultValue: "NULL")
    var login: String
    
    // MARK: - Setter login
    func setLogin(login: String) {
        self.login = login
    }
    
    // MARK: - Getter login
    func getLogin() -> String {
        return self.login
    }
    
    
    
    // MARK: - Saved profile image url
    @Storage(key: "profile_image_url", defaultValue: "NULL")
    var profile_image_url: String
    
    // MARK: - Setter profile image url
    func setProfile_image_url(profile_image_url: String) {
        self.profile_image_url = profile_image_url
    }
    
    // MARK: - Getter profile image url
    func getProfile_image_url() -> String {
        return self.profile_image_url
    }
    
    // MARK: - Saved mochi
    @Storage(key: "mochi", defaultValue: "{\n  \"pPoop\" : 0,\n  \"birth\" : 676457247.92682195,\n  \"pHealthHunger\" : 0,\n  \"health\" : 0,\n  \"energy\" : 0,\n  \"pHunger\" : 0,\n  \"pHappyness\" : 0,\n  \"maxEnergy\" : 0,\n  \"pHealthIll\" : 0,\n  \"is_new\" : true,\n  \"pHealthThirst\" : 0,\n  \"pThirst\" : 0,\n  \"cleanlyness\" : 0,\n  \"ageType\" : 0,\n  \"pWake\" : 0,\n  \"maxThirst\" : 0,\n  \"nPoop\" : 0,\n  \"sleeping\" : false,\n  \"euphoria\" : false,\n  \"maxHappiness\" : 0,\n  \"hunger\" : 0,\n  \"maxHunger\" : 0,\n  \"pEnergyGain\" : 0,\n  \"maxHealth\" : 0,\n  \"happiness\" : 0,\n  \"thirst\" : 0,\n  \"maxCleanlyness\" : 0,\n  \"pCleanlyness\" : 0,\n  \"pIll\" : 0,\n  \"pEnergy\" : 0,\n  \"ill\" : false,\n  \"streaming\" : false,\n  \"alive\" : false\n}")
    var mochi: String
    
    // MARK: - Setter mochi
    func setMochi(mochi: MochiJson) {
        
        do {
            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(mochi)
            
            print(encoded!.jsonString() as Any)
            
            self.mochi = encoded!.jsonString()!
            
        } catch {
            print("Error Encoding Mochi")
            print(error)
            self.mochi = "NULL"
        }
        
    }
    
    // MARK: - Getter mochi
    func getMochi() -> MochiJson? {
        
        do {
            
            let decoder = JSONDecoder()
            
            let jsonData: Data = self.mochi.data(using: .utf8)!
            
            let mochiDecoded = try? decoder.decode(MochiJson.self, from: jsonData)
            
            return mochiDecoded
            
        } catch {
            print("Error Decoding Mochi")
            print(error)
        }
    }
    
    // MARK: - Saved Currencies
    @Storage(key: "currencies", defaultValue: "{\n  \"money\" : 0,\n  \"followers\" : 0,\n  \"bite\" : 0\n}")
    var currencies: String
    
    // MARK: - Setter Currencies
    func setCurrencies(currencies: CurrenciesJson) {
        
        do {
            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(currencies)
            
            print(encoded!.jsonString() as Any)
            
            self.currencies = encoded!.jsonString()!
            
        } catch {
            print("Error Encoding currencies")
            print(error)
            self.mochi = "NULL"
        }
        
    }
    
    // MARK: - Getter currencies
    func getCurrencies() -> CurrenciesJson? {
        
        do {
            
            let decoder = JSONDecoder()
            
            let jsonData: Data = self.currencies.data(using: .utf8)!
            
            let currenciesDecoded = try? decoder.decode(CurrenciesJson.self, from: jsonData)
            
            return currenciesDecoded
            
        } catch {
            print("Error Decoding currencies")
            print(error)
        }
    }
    // MARK: - Saved timeManager
    @Storage(key: "timeManager", defaultValue: "{\n  \"savedDate\" : -63114076800,\n  \"arrayHappyness\" : [\n\n  ],\n  \"lastSave\" : -63114076800\n}")
    var timeManager: String
    
    // MARK: - Setter timeManager
    func setTimeManager(timeManager: TimeManagerJson) {
        
        do {
            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(timeManager)
            
            print(encoded!.jsonString() as Any)
            
            self.timeManager = encoded!.jsonString()!
            
        } catch {
            print("Error Encoding timeManager")
            print(error)
            self.timeManager = "NULL"
        }
        
    }
    
    // MARK: - Getter inventory
    func getTimeManager() -> TimeManagerJson? {
        
        do {
            
            let decoder = JSONDecoder()
            
            let jsonData: Data = self.timeManager.data(using: .utf8)!
            
            let timeManagerDecoded = try? decoder.decode(TimeManagerJson.self, from: jsonData)
            
            return timeManagerDecoded
            
        } catch {
            print("Error Decoding timeManager")
            print(error)
        }
    }
    
    // MARK: - Saved inventory
    @Storage(key: "inventory", defaultValue: "{\n  \"i\" : [\n\n  ]\n}")
    var inventory: String
    
    // MARK: - Setter inventory
    func setInventory(inventory: InventoryJson) {
        
        do {
            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(inventory)
            
            print(encoded!.jsonString() as Any)
            
            self.inventory = encoded!.jsonString()!
            
        } catch {
            print("Error Encoding inventory")
            print(error)
            self.inventory = "NULL"
        }
        
    }
    
    // MARK: - Getter inventory
    func getInventory() -> InventoryJson?{
        
        do {
            
            let decoder = JSONDecoder()
            
            let jsonData: Data = self.inventory.data(using: .utf8)!
            
            let inventoryDecoded = try? decoder.decode(InventoryJson.self, from: jsonData)
            
            return inventoryDecoded
            
        } catch {
            print("Error Decoding Inventory")
            print(error)
        }
    }
    // MARK: - Saved inventory
    @Storage(key: "customInventory", defaultValue: "{\n  \"i\" : [\n\n  ]\n}")
    var customInventory: String
    
    // MARK: - Setter inventory
    func setCustomInventory(customInventory: CustomInventoryJson) {
        
        do {
            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(customInventory)
            
            print(encoded!.jsonString() as Any)
            
            self.customInventory = encoded!.jsonString()!
            
        } catch {
            print("Error Encoding custom inventory")
            print(error)
            self.customInventory = "NULL"
        }
        
    }
    
    // MARK: - Getter inventory
    func getCustomInventory() -> CustomInventoryJson? {
        
        do {
            
            let decoder = JSONDecoder()
            
            let jsonData: Data = self.customInventory.data(using: .utf8)!
            
            let customInventoryDecoded = try? decoder.decode(CustomInventoryJson.self, from: jsonData)
            
            return customInventoryDecoded
            
        } catch {
            print("Error Decoding Custom Inventory")
            print(error)
        }
    }
    // MARK: - Saved streaming
    @Storage(key: "streamingInventory", defaultValue: "{\n  \"i\" : [\n\n  ]\n}")
    var streamingInventory: String
    
    // MARK: - Setter streaming
    func setStreamingInventory(streamingInventory: StreamingInventoryJson) {
        
        do {
            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(streamingInventory)
            
            print(encoded!.jsonString() as Any)
            
            self.streamingInventory = encoded!.jsonString()!
            
        } catch {
            print("Error Encoding custom inventory")
            print(error)
            self.streamingInventory = "NULL"
        }
        
    }
    
    // MARK: - Getter streaming
    func getStreamingInventory() -> StreamingInventoryJson? {
        
        do {
            
            let decoder = JSONDecoder()
            
            let jsonData: Data = self.streamingInventory.data(using: .utf8)!
            
            let streamingInventoryDecoded = try? decoder.decode(StreamingInventoryJson.self, from: jsonData)
            
            return streamingInventoryDecoded
            
        } catch {
            print("Error Decoding streaming Inventory")
            print(error)
        }
    }
}

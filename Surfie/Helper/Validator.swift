/**
 This is a text validator class which contains validation functions for most used cases like email validation, required validation etc.
 */

import UIKit


class Validator {
    
    /**
     Call this function to validate Email Id
     */
    static func email(_ email:String) -> Bool  {
        
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        if !(emailPredicate.evaluate(with: email)) {
            return false
        }
        return true
    }
    
    /**
     Call this function to validate required fields
     */
    
    static func required(_ text:String) -> Bool {
        if text == StaticText.EmptyText {
            return false
        }
        return true
    }
    
    /**
     Call this function to validate string minimum characters count
     */
    
    static func minCharactersCount(_ text: String, minCount: Int?) -> Bool {
        return charactersCount(text, minCount: minCount, maxCount: nil)
    }
    static func maxCharactersCount(_ text: String, maxCount: Int?) -> Bool {
        return charactersCount(text, minCount:nil, maxCount: maxCount)
    }
    
    /**
     Call this function to validate string minimum and maximum characters count
     */
    
    static func charactersCount(_ text: String, minCount: Int?, maxCount: Int?) -> Bool {
        if minCount != nil {
            if text.count < minCount! {
                return false
            }
        }
        if maxCount != nil {
            if text.count > maxCount! {
                return false
            }
        }
        return true
    }
    
    /**
     Call this function to validate equality
     */
    
    static func equality(_ firstItem: String, secondItem: String) -> Bool {
        if secondItem != firstItem {
            return false
        }
        return true
    }
    
    /**
     Call this function to validate password with custom Regex string
     */
    
    static func password(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,24}$")
        if !(passwordTest.evaluate(with: password)) {
            return false
        }
        return true
    }
    
    
    /**
     Call this function to validate NAME with custom Regex string
     */
    static func validName(_ testStr: String) -> Bool {
        let nameRegex = "^[a-zA-Z\\s]{1,16}$"
        let trimmedString = testStr.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
    }
    
    /**
     Call this function to validate First NAME with custom Regex string
     */
    static func validFirstName(_ name: String) -> Bool {
        let nameFormat = "^(?=.{1,16}$)[a-zA-Z]+(?:[-'\\s][a-zA-Z]+)*$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameFormat)
        if !(namePredicate.evaluate(with: name)) {
            return false
        }
        return true
    }
    
    /**
     Call this function to validate Last NAME with custom Regex string
     */
    static func validLastName(_ name: String) -> Bool {
        let nameFormat = "^[a-z]{3,13}$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameFormat)
        if !(namePredicate.evaluate(with: name)) {
            return false
        }
        return true
    }
    
    
    /**
     Call this function to validate #VIN with custom Regex string
     */
    static func validVIN(_ testStr: String) -> Bool {
        let nameRegex = "[^a-zA-Z0-9]"
        let trimmedString = testStr.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
    }
}


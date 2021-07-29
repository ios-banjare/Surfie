//
//  Constants.swift
//  Surfie
//
//  Created by Mahadev on 25/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.
//

import Foundation
import UIKit


let kAppDelegateObj = UIApplication.shared.delegate as! AppDelegate


enum StoryboardNames: String {
    case Main, Experience, Payment, Profile
}

struct StoryboardIds {
    static let Login = "LoginViewController"
    static let OTP = "OTPViewController"
    static let Vehicles = "VehiclesViewController"
    static let Experiences = "ExperiencesViewController"
    static let Home = "DashboardViewController"
    static let Menu = "MenuViewController"
    static let Reviews = "ReviewsViewController"
    static let Profile = "ProfileViewController"
    static let CardsVC = "CardsViewController"
    static let AddCardVC = "AddCardViewController"
    static let HistoryVC = "HistoryViewController"
    static let RentHistoryVC = "RentHistoryViewController"
    static let ExperienceHistoryVC = "ExperienceHistoryViewController"
    static let VehicleHistoryVC = "VehicleHistoryViewController"
    static let MiscellaneousVC = "MiscellaneousViewController"
    static let TutorialVC = "TutorialViewController"
    static let InviteFriendVC = "InviteFriendViewController"
    static let SurfVC = "SurfViewController"
    static let ProfileInfoVC = "ProfileInfoViewController"
    static let ProfilePicVC = "ProfilePicViewController"
    static let EmailVC = "EmailViewController"
    static let TravelDetailVC = "TravelDetailViewController"
}

struct CustomCellIds {
    static let Tutorial = "TutorialCollectionViewCell"
    static let VehiclesCollectionCell = "VehiclesCollectionViewCell"
    static let VehiclesTableCell = "VehiclesTableViewCell"
    static let ExperienceCollectionCell = "ExperienceCollectionViewCell"
    static let ExperienceTableCell = "ExperienceTableViewCell"
    static let CategoryCollectionCell = "CategoryCollectionViewCell"
    static let ReviewsTableCell = "ReviewsTableViewCell"
    static let DefaultTableCell = "DefaultTableViewCell"
    static let HistoryTableCell = "HistoryTableViewCell"
    static let Cell = "Cell"
}

struct ViewNames {
    static let header = "HeaderView"
    static let footer = "FooterView"
    static let secondaryHeader = "SecondaryHeaderView"
}

struct StaticNumbers {
    static let Zero: CGFloat = 0
    static let ThirtyTwo: CGFloat = 32
    static let EightyTwo: CGFloat = 82
}


struct SideMenuConstant {
    
}


struct FontNames {
    static let Medium = "Montserrat-Medium"
    static let Bold = "Montserrat-Bold"
    static let SemiBold = "Montserrat-SemiBold"
    static let Regular = "Montserrat-Regular"
}



struct Screen {
    static let Width = UIScreen.main.bounds.size.width
    static let Height = UIScreen.main.bounds.size.height
}

struct IconName {
    static let BackArrow = "arrow-back"
    static let Warning = "Warning"
    static let Bell = "icon-bell"
    
}

struct ConstantUrls  {
    //Add in App Config
    static let urlShareLocation  = "http://www.google.com/maps/place/"
}


enum AccessorySteps : Int {
    case First = 1, Second, Third, Fourth
}

struct NotificationType {
    static let type1  = "1"
    static let type2 = "2"
    static let type3 = "3"
    static let type4 = "4"
    static let type5 = "5"
    static let type6 = "6"
    static let type7 = "7"
    static let type8 = "8"
    static let type9 = "9"
    static let type10 = "10"
    static let type11 = "11"
    static let type12 = "12"
    static let type13 = "13"
    static let type14 = "14"
    static let type15 = "15"
    static let type16 = "16"
    static let type17 = "17"
    static let type26 = "26"
}

struct MonthVal {
    static let Month1  = "01"
    static let Month2 = "02"
    static let Month3 = "03"
    static let Month4 = "04"
    static let Month5 = "05"
    static let Month6 = "06"
    static let Month7 = "07"
    static let Month8 = "08"
    static let Month9 = "09"
    static let Month10 = "10"
    static let Month11 = "11"
    static let Month12 = "12"
}

enum POISeletced : Int {
    case First = 0, Second, Third, Fourth, Fifth
}

enum CommonSelector: Int {
    case First = 0, Second, Third, Fourth, Fifth
}

enum CommonNumber: Int {
    case executeTime = 20
}

struct LocalizedText {
    static let Close = "CLOSED".local
    static let Open = "OPEN".local
    
    static let Jan = "JAN".local
    static let Feb = "FEB".local
    static let Mar = "MAR".local
    static let Apr = "APR".local
    static let May = "MAY".local
    static let Jun = "JUN".local
    static let Jul = "JUL".local
    static let Aug = "AUG".local
    static let Sept = "SEPT".local
    static let Oct = "OCT".local
    static let Nov = "NOV".local
    static let Dec = "DEC".local
    static let ConfirmPasswordRequired = "CONFIRM_PASSWORD_REQUIRED".local
    static let NoData = "NO_DATA".local
    
    static let SelectDateTime = "SELECT_DATE_TIME".local
    static let Authenticate = "AUTHENTICATE".local
    
    static let SecondAgo = "SECONDAGO".local
    static let MinuteAgo = "MINUTEAGO".local
    static let HourAgo = "HOURAGO".local
    
    static let dayAgo = "DATAGO".local
    static let Space = "SPACE".local
    
}

struct StaticText {
    
    static let ErrorCodePrefix = "ERROR_CODE_"
    static let FAILED = "FAILED"
    static let randomNumberGenerator = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    static let UserDetail = "UserDetail"
    static let UsaCountryCode = "+1"
    static let VehicleModel = "DUMMY_MODEL".local
    static let EmptyText = ""
    static let NavTitle = "John's Land Cruiser"
    static let NavAppTitle = "APPLICATIONS".local
    static let PhoneNumber = "999999999"
    static let Back = "BACK".local
    static let ShowingResultsTxt = "SHOWING_RESULTS_FOR".local
    static let InvertedComma = "\""
    static let Comma = ","
    static let PlaceholderForGoogle = "SEARCH_FOR_GOOGLE_LOCATION_PLACEHOLDER".local
    static let PlaceholderForZomato = "SEARCH_FOR_ZOMATO_LOCATION_PLACEHOLDER".local
    static let PlaceholderForFoursquare = "SEARCH_FOR_FOURSQUARE_LOCATION_PLACEHOLDER".local
    static let PlaceholderForParking = "SEARCH_FOR_PARKING_LOCATION_PLACEHOLDER".local
    static let SearchParkingTab = "SEARCH_PARKING".local
    static let MyReservationsTab = "MY_RESERVATIONS".local
    static let ResetPasswordSuccess = "RESET_PASSWORD_SUCCESS".local
    
    static let ContentSize = "contentSize"
    static let Space = " "
    static let NoResultsTxt = "We couldn't find any results for "
    static let TryAgainForDestination = "Try searching again for a destination."
    static let DetailNotAvailable = "Detail is not available for this search item"
    static let NoResultForParkingSlot = "No result in this area. \n Please search a different area."
    static let NotApplicable = "NA"
    static let Review = " Review"
    static let Reviews = " Reviews"
    static let Inrix = "inrix"
    static let Free = "Free"
    static let NoReview = "No Review"
    static let Hyphon = "-"
    static let Dot = "."
    static let StartTime = "6:30 PM"
    static let EndTime = "10:30 PM"
    static let Email = "j.richardson@mail.com"
    static let RightArrow = "\u{2794}"
    static let OutOf = " out of "
    static let SpotsAvailable = " Spots Available "
    static let Zero = "0"
    static let Ten = "10"
    static let Indoor = "INDOOR_TEMP".local
    static let Outdoor = "OUTDOOR_TEMP".local
    static let Seperator = " | "
    
    static let engineStatusOn = "On"
    static let engineStatusOff = "Off"
    static let Number = "0123456789"
    
    static let loginFailed = "Login failed"
    static let validationFailed = "Validation failed"
    
    static let EngineNotStarted = "ENGINE_NOT_STARTED".local
    static let EngineNotStopped = "ENGINE_NOT_STOPPED".local
    
    static let ModelSUV = "SUV"
    static let ModelSedan = "Sedan"
    static let ModelCoupe = "Coupe"
    
    static let oneKPAInPSI: Float = 6.894
    static let PSI = " psi"
    static let pressurePSI = "psi"
    static let pressurekPa = "kPa"
    static let Close = "Close"
    static let STATUS = "STATUS".local
    static let LOCATION = "LOCATION".local
    static let TRIPS = "TRIPS".local
    static let Open = "Open"
    static let GeoFenceName = "Geo Fence 1"
    
    static let PrimaryOwner = "PRIMARY_OWNER".local
    static let SecondaryOwner = "SECONDARY_OWNER".local
    static let UnitKM = "KILO_METER".local
    static let noDealerAvailable = "NO_DEALERS_AVAILABLE".local
    static let noVehicleAvailable = "NO_VEHICLE_AVAILABLE".local
    
    static let noPaymentMethodAvailable = "NO_PAYMENT_METHOD_AVAILABLE".local
    static let EngineStarted = "ENGINE_STARTED".local
    static let EngineStopped = "ENGINE_STOPPED".local
    static let VerificationFailed = "VERIFICATION_FAILED".local
    static let Near = "NEAR".local
    static let TripsDeleted = "TRIPS_DELETED".local
    static let TripDeleted = "TRIP_DELETED".local
    static let Plus = "+"
    static let ThingRequired = "Validation failed: ThingName is a required parameter."
    static let VehicleOrAccessoryNA = "VEHICLE_OR_ACCESSORY_NA".local
    
    static let Profile = "PROFILE".local
    static let Billing = "BILLING".local
    static let SelectMeasurementUnit = "SELECT_MEASUREMENT_UNIT".local
    static let Backspace = "\\b"
    static let Minute = "min"
    
    static let MetricUnit = "M"
    static let ImperialUnit = "E"
    static let Celsius = "˚C"
    static let Fahrenheit = "˚F"
    static let Metric = "Metric"
    static let Imperial = "Imperial"
    static let DevInsider = "Developer Insider"
    static let CydiaString = "cydia://"
    
    static let AlreadyRegistered = "ALREADY_REGISTERED".local
    
    static let Theme = "Theme"
    static let Dark = "Dark"
    static let Light = "Light"
    static let Auto = "Auto"
    static let ToyotaDBName = "ToyotaCoreData"
    static let OK = "OK"
    static let Succeeded = "succeeded"
    static let MailNotConfiguredInSettings = "Mail services are not available! please configure it in your settings"
    static let dataSharingResponseHideLocation = "HIDE_LOCATION"
    
    static let deletedVehicleSuccessfully = "VEHICLE_SUCCESSFULLY_DELETED".local
    static let tokenExpiredDueToPasswordChangeFromOtherDevices = "EXPIRED_TOKEN_DUE_TO_PASSWORD_CHANGE_ON_OTHER_DEVICES".local
}


struct ImageName {
    
}


struct StaticCharacter {
    static let SecureStar = "****"
    static let Star = "*"
    static let AtSign = "@"
    static let And = "&"
    static let Column = ":"
    static let Dollor = "$"
    static let CreditCardStar = "**** **** ****"
    static let Degree = "˚"
    static let LeftBracket = "("
    static let RightBracket = ")"
}


enum PlistKey: String {
    case BaseUrl, AppName
}

struct AppLocale {
    static let English = "en_US"
}

/// Debug Mode for print
func DPrint(_ items: Any...) {
    
    #if DEBUG
    var startIdx = items.startIndex
    let endIdx = items.endIndex
    
    repeat {
        Swift.print(items[startIdx])
        startIdx += 1
    }
    while startIdx < endIdx
    
    #endif
}

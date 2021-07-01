/**
 This class contains the date formats
 */

import Foundation

enum DateFormats: String {
    
    /**
     "yyyy-MM-dd HH:mm:ssZ"
     */
    case format1 = "yyyy-MM-dd HH:mm:ssZ"
    
    /**
     "EEEE, MMM d 'at' h:mm a - Monday, Aug 1 at 6:30 PM"
     */
    case format2 = "EEEE, MMM d 'at' h:mm a"
    
    /**
     "h:mm a - 6:30 PM"
     */
    case format3 = "h:mm a"
    
    /**
     "EEE, MMM d, yyyy - Mon, Aug 1, 2020"
     */
    case format4 = "EEE, MMM d, yyyy"
    
    /**
     "yyyy-MM-dd - 2020-11-02"
     */
    case format5 = "yyyy-MM-dd"
    
    /**
     "dd-MM-yyyy - 12-11-2020"
     */
    case format6 = "dd-MM-yyyy"
    
    /**
     "hh:mm a - 06:30 PM"
     */
    case format7 = "hh:mm a"
    
    /**
     "d MMM, yyyy, h:mm a - 4 Nov, 2020, 11:24 AM"
     */
    case format8 = "d MMM, yyyy, h:mm a"
    
    /**
     "MMM d, yyyy - Aug 1, 2020"
     */
    case format9 = "MMM d, yyyy"
    
    /**
     "MMM d - Aug 1"
     */
    case format10 = "MMM d"
    
    /**
     "dd MMM yyyy - 20 July 2020"
     */
    case format11 = "dd MMM yyyy"
    
    /**
     "dd-MM-yyyy hh:mm a - 12-11-2020 06:30 PM"
     */
    case format12 = "dd-MM-yyyy hh:mm a"
    
    /**
     "EEE, MMM d, yyyy hh:mm a - Mon, Aug 1, 2020 06:30 PM"
     */
    case format13 = "EEE, MMM d, yyyy hh:mm a"
    
    /**
     "EEE, MMM d, yyyy, hh:mm a - Mon, Aug 1, 2020 6:30 PM"
     */
    case format14 = "EEE, MMM d, yyyy, h:mm a"
}

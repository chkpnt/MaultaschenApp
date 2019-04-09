//
//  OverviewStrings.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 04.04.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

struct OverviewStrings {
    
    static let tabBarItemTitle = NSLocalizedString("TabBarItemTitle", tableName: "OverviewWireframe", value: "Overview",
        comment: "Overview (noun), will be displayed in the tab bar. The user should get an overview about the nearby available meals / venues.")
    
    
    // Only as an example, this is not used within the app.
    private static let mealsTodayTemplate = NSLocalizedString("Meals today", tableName: "OverviewWireframe",
        comment: "Like 'Today, there is nothing to eat.' or 'Today, you can choose between 5 meals in 2 venues.' Used as a greating phrase.")
    
    static func mealsToday(numberOfMeals: Int, numberOfVenues: Int) -> String {
        return String(format: mealsTodayTemplate, numberOfMeals, numberOfVenues)
    }
}


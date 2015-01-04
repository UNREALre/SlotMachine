//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Александр Подрабинович on 04/01/15.
//  Copyright (c) 2015 Alex Podrabinovich. All rights reserved.
//

import Foundation

class SlotBrain {
    class func computeWinings(slots: [[Slot]]) -> Int {
        var winings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotsInRow in slots {
            if SlotBrain.checkFlush(slotsInRow) {
                winings++
                flushWinCount++
            }
            if SlotBrain.checkThreeInARow(slotsInRow) {
                winings++
                straightWinCount++
            }
            if SlotBrain.checkThreeOfAKind(slotsInRow) {
                winings+=3
                threeOfAKindWinCount++
            }
        }
        
        if flushWinCount == 3 {
            winings += 15
        }
        if straightWinCount == 3 {
            winings += 1000
        }
        if threeOfAKindWinCount == 3 {
            winings += 50
        }
        
        return winings
    }
    
    class func checkFlush(slotsInRow: [Slot]) -> Bool {
        var allRed: Bool?
        var allBlack: Bool?
        
        for slot in slotsInRow {
            if slot.isRed {
                if allRed == nil {
                    allRed = true
                }
                
                allBlack = false
            }
            else {
                if allBlack == nil {
                    allBlack = true
                }
                
                allRed = false
            }
        }
        
        if allBlack! || allRed! {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeInARow(slotsInRow: [Slot]) -> Bool {
        var threeInRow = true
        
        for var i=0; i<(slotsInRow.count - 1); i++ {
            if slotsInRow[i].value != (slotsInRow[i+1].value - 1) {
                threeInRow = false
                break
            }
        }
        
        if !threeInRow {
            for var i=0; i<(slotsInRow.count - 1); i++ {
                if slotsInRow[i].value != (slotsInRow[i+1].value + 1) {
                    threeInRow = false
                    break
                }
            }
        }
        
        return threeInRow
    }
    
    class func checkThreeOfAKind(slotsInRow: [Slot]) -> Bool {
        var threeOfAKind = true
        
        for var i=0; i<(slotsInRow.count - 1); i++ {
            if slotsInRow[i].value != slotsInRow[i+1].value {
                threeOfAKind = false
                break
            }
        }
        
        return threeOfAKind
    }
}
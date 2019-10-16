//: A UIKit based Playground for presenting user interface

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    var rooms = [[[Int]]]()
    var prevInterval = [Int]()
    let intervals = intervals.sorted(by: { $0[0] < $1[0] })
    for interval in intervals {
        if rooms.isEmpty {
            var roomOne = [[Int]]()
            roomOne.append(interval)
            rooms.append(roomOne)
        } else {
            let intervalRange = interval[0]..<interval[1]
            let prevRange = prevInterval[0]..<prevInterval[1]

            if intervalRange.overlaps(prevRange) {
                if let indexOfRoom = indexOfAvailableRoom(rooms, interval: interval) {
                    // Means that I have room available at rooom index
                    let room = rooms[indexOfRoom]
                    var newRoom = [[Int]]()
                    newRoom.append(contentsOf: room)
                    newRoom.append(interval)
                    rooms[indexOfRoom] = newRoom
                } else {
                    // Create a new room
                    var newRoom = [[Int]]()
                    newRoom.append(interval)
                    rooms.append(newRoom)
                }
            } else {
                if let indexOfRoom = indexOfAvailableRoom(rooms, interval: interval) {
                    // Means that I have room available at rooom index
                    let room = rooms[indexOfRoom]
                    var newRoom = [[Int]]()
                    newRoom.append(contentsOf: room)
                    newRoom.append(interval)
                    rooms[indexOfRoom] = newRoom
                }
            }

        }
        prevInterval = interval
    }

    return rooms.count
}


func indexOfAvailableRoom(_ rooms: [[[Int]]], interval: [Int]) -> Int? {
    guard !rooms.isEmpty else {
        return nil
    }
    for (index,room) in rooms.enumerated() {
        let lastIntervalInRoom = room.last!
        print(lastIntervalInRoom)
        if interval[0] >= lastIntervalInRoom[1]  {
            return index
        }
    }
    return nil
}

let input = [[0, 30],[5, 10],[15, 20]]
print(minMeetingRooms([[2,11],[6,16],[11,16]]))
print(minMeetingRooms([[1,5],[8,9],[8,9]]))

print(minMeetingRooms(input))
print(minMeetingRooms([[7,10],[2,4]]))

/**

 Not good solution, but happy cuz was brute force without any help

 Runtime: 852 ms, faster than 6.48% of Swift online submissions for Meeting Rooms II.
 Memory Usage: 21.4 MB, less than 50.00% of Swift online submissions for Meeting Rooms II.

 */

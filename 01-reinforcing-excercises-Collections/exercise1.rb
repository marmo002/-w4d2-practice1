$sample = {
  data:
    {
      rooms:
        [
          {
            id: 1,
            room_number: "201",
            capacity: 50
          },
          {
            id: 2,
            room_number: "301",
            capacity: 200
          },
          {
            id: 3,
            room_number: "1B",
            capacity: 100
          }
        ],
      events: [
        { id: 1, room_id: 2, start_time: 18, end_time: 20, attendees: 75 },
        { id: 2, room_id: 1, start_time: 10, end_time: 18, attendees: 25 },
        { id: 3, room_id: 2, start_time: 10, end_time: 18, attendees: 20 },
        { id: 4, room_id: 3, start_time: 18, end_time: 21, attendees: 56 },
      ]
  }
}


# room201 = sample[:data][:rooms].each { |room| room[:capacity] ? room[:room_number] == "201" }
def room_capacity(room_number)
  $sample[:data][:rooms].find do |room|
    room[:room_number] == room_number
  end[:capacity]

end

capacity =  room_capacity("201")

$sample[:data][:events].each do |event|
  if event[:room_id] == 1 && event[:attendees] < 51
    puts "ok"
  end
end

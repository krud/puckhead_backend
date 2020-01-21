require 'rest-client'

Player.destroy_all

ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 52, 53, 54]

for i in ids do  

    response = RestClient.get("https://statsapi.web.nhl.com/api/v1/teams/#{i}/roster")    
    result = JSON.parse(response)

    result["roster"].map do |person| 

        p_id = person["person"]["id"]

        new_link = "https://statsapi.web.nhl.com/api/v1/people/#{p_id}"
        response2 = RestClient.get(new_link)
        result2 = JSON.parse(response2)

        result2["people"].map {|player| 
            Player.create(
                firstName: player["firstName"], 
                lastName: player["lastName"], 
                primaryNumber: player["primaryNumber"],
                active: player["active"],
                currentTeam: player["currentTeam"]["name"],
                primaryPosition: player["primaryPosition"]["name"],
                img: "https://cdn.vox-cdn.com/thumbor/ok2LY7-qBaH1WjqqdPoYyZN9gHA=/0x0:4232x2963/1200x800/filters:focal(1136x425:1812x1101)/cdn.vox-cdn.com/uploads/chorus_image/image/58330365/904656492.jpg.0.jpg"
            )}
    end 
end 
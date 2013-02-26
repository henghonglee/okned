
  task :foursquareForImages => :environment do
    Foursquare.verbose = true
    foursquare = Foursquare::Base.new("0I2PNVLT0YDCXPVQCN3IU2XWFLEJYM3WSY42JYCB1CETRUND")    
    

    for item in Item.all
      begin
        puts item.title
       ll ="#{item.latitude},#{item.longitude}"
       a = foursquare.venues.search(:ll => ll , :query => item.title.downcase.strip)
       for fsObject in a.first.second
         if fsObject.json["name"].downcase.strip == item.title.downcase.strip
           venue = foursquare.venues.find(fsObject.json["id"])
           for photogroups in venue.json["photos"]["groups"]
               if photogroups["type"] == "venue"             
                 if photogroups["count"] > 0
                   item.images = []
                   for photoitem in photogroups["items"]
                     item.images << photoitem["url"]
                     puts photoitem["url"]
                   end
                   item.save
                   puts item.id
                 end
               end
           end
         end
       end
       rescue   
       end
    end
  end
 task :removeColon => :environment do
   for item in Item.all
     a = item.title
     if a.include?":"
     title = a.slice(0,a.index(":")).strip
     subtitle = a.slice(a.index(":")+1,a.length).strip
     item.title = title
     item.subtitle = subtitle
     item.save
   end
   end
 end
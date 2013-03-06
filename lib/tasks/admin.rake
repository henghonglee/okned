require "rubygems"
require "instagram"
  task :googleWebSearch2 => :environment do
    
  end
  task :googleWebSearch => :environment do
    # for item in Item.all
    #     item.foursqure_venue = nil;
    #     item.save
    #   end

    for item in Item.where(:is_post => true , :foursqure_venue => nil)
      item.foursqure_venue = nil;
      item.flagged = true;
      puts item.title;
      begin
        results = GoogleCustomSearchApi.search(item.title + "")
        puts results
        for i in results["items"]
          puts i["link"]
        if i["link"].include?"foursquare" 
          if i["link"].split(/\/(?=[^\/]+(?: |$))| /).second.length == 24
            item.foursqure_venue = i["link"].split(/\/(?=[^\/]+(?: |$))| /).second
            puts item.title + "  " + item.foursqure_venue
            break
          end
        end
      end
    rescue
    end
      item.save
     end
   end

task :instagramForImages => :environment do
  
  foursquare = Foursquare::Base.new("0I2PNVLT0YDCXPVQCN3IU2XWFLEJYM3WSY42JYCB1CETRUND")    
  Instagram.configure do |config|
    config.client_id = "7c322e5fc93940358f93df9735ed5bec"
    config.access_token = "18393300.7c322e5.02c4345e7c4141f982acb8cac85a56ee"
  end
         for item in Item.where("foursqure_venue IS NOT NULL")
           begin           
             a = Instagram.location_search(item.foursqure_venue)
             puts a
             for i in Instagram.location_recent_media(a.first.id)
               item.images.unshift(i.images.standard_resolution.url)
               puts i.images.standard_resolution.url
             end
             item.save  
            rescue
            end
        end
    end

  task :foursquareForImages => :environment do
    for item in Item.all
     item.images = [];
     item.low_res_images = [];
     item.save
   end
    
    foursquare = Foursquare::Base.new("0I2PNVLT0YDCXPVQCN3IU2XWFLEJYM3WSY42JYCB1CETRUND")    
    userless =  Foursquare::Base.new("OXI2P5EYFZPKQFPCRNWFADOHPONUAWRBNRRGKBV0WDWTQPSJ", "P0WJY4OUBJ14DL0SBSBUVT3PTEFS24VLJGA4M1UJGJMT3XLD")
    locations = ["Jurong East","Bukit Batok","Bukit Gombak","Choa Chu Kang","Yew Tee","Kranji","Marsiling","Woodlands","Admiralty","Sembawang","Yishun","Khatib","Yio Chu Kang","Ang Mo Kio","Bishan","Braddell","Toa Payoh","Novena","Newton","Orchard","Somerset","Dhoby Ghaut","City Hall","Raffles Place","Marina Bay","Pasir Ris","Tampines","Simei","Tanah Merah","Bedok","Kembangan","Eunos","Lavender","Old Airport","Food Centre","Hawker"]
    foodtypes = ["Ang Ku Kueh","Appam","Ayam Penyet","Apple Strudel","Bak Chang","Bak Chor mee","Mee Pok","Minced Meat Noodle","Bak Kut Teh","Baked Soups","Ban Mian","Mee Hoon Kueh","Beancurd","Beef Kway Teow","Biryani","Braised Duck","Breakfast","Burger","Buffet","Biscuit","Beef Noodle","Beer","Bread","Bakery","Carrot Cake","Cheese Cake","Char Kway Teow","Chicken Rice","Rojak","Chwee Kueh","Cheng Tng","Claypot Rice","Crab","Curry Mee","Curry Puff","Curry Rice","Curry Chicken","Cuttlefish Kangkong","Cze Char","Coffee","Dessert","Dim Sum","Durian","Durian Puff","Duck Rice","Economical Rice","Expresso","Egg Tart","Fish Head Curry","Fish Soup","Fries","Fishball","Fried Kway Teow","Fish Head Steamboat","Fried Chicken","Frog Porridge","Goreng Pisang","Hainanese Curry Rice","Hawker Western Food ","Hakka","Hokkien Mee","Hokkien Prawn Mee","Hong Kong","Hor Fun","Hum Jin Pang","Indian Rojak","Ice Cream","Italian","Indian","Ipoh Hor Fun","Japanese","KL Hokkien Mee","Kopi And Toast","Kueh Tutu","Korean","Kway Chap","Laksa","Lor Mee","Mee Goreng","Mee Rebus","Milkshake","Mee Siam","Mee Soto","Muah Chee","Mutton Soup","Nasi Lemak","Nasi Padang","Ngoh Hiang","Otah","Oyster Omelette","Pau","Popiah","Porridge","Pizza","Prawn Mee","Pancake","Pigs Organ Soup","Prata","Prawn Noodle","Ramen","Pork Ribs","Salad","Satay","Satay Bee Hoon","Seafood","Steamboat","Soy Sauce Chicken","Specialty Coffee","Soup","Sup Kambing","Sushi","Steak","Sup Tulang","Teh Tarik","Thunder Tea Rice","Thai","Milk Tea","Taiwan","Teochew Kueh","Teochew Porridge","Vegetarian","Vegan","Vietnamese","Wanton Mee","Waffle","Western","Xiao Long Bao","Yogurt","You Char Kway","Mushroom Fishball Minced Meat Noodles", "Fishball Mee","Minced Meat Noodle","Minced Meat Noodles","Mushroom Minced Meat Noodle"]

    
    for item in Item.all

                begin
        if !item.foursqure_venue.nil?
            puts "has venue"
          venue = foursquare.venues.find(item.foursqure_venue)

          for photogroups in venue.json["photos"]["groups"]
              if photogroups["type"] == "venue"             
                if photogroups["count"] > 0
                  item.images = []
                  for photoitem in photogroups["items"]
                    item.images << photoitem["url"]
                    puts photoitem["url"]            
                    for low_res in photoitem["sizes"]["items"]
                       if low_res["width"] == 300
                        item.low_res_images << low_res["url"]
                         puts low_res["url"]
                       end
                     end
                  end
                end
              end
          end
          item.save
          end


       puts item.title 
       ll ="#{item.latitude},#{item.longitude}"
       a = userless.venues.search(:ll => ll,:limit=>50)
       for fsObject in a.first.second
         titleSplit = item.title.downcase.strip.split(" ")
         fsTitleSplit = fsObject.json["name"].downcase.strip.split(" ")
         matchCount = 0
         for titleSegment in titleSplit
           for fsTitleSegment in fsTitleSplit
             if titleSegment.strip == fsTitleSegment.strip
               matchCount = matchCount + 1
             end
           end
         end
         
         if matchCount > 2 and item.foursqure_venue.nil?
           item.foursqure_venue = fsObject.json["id"]
           puts "["+item.title + "] found on 1st pass ...[" + fsObject.json["name"]+"] id= "+ fsObject.json["id"]
           venue = foursquare.venues.find(fsObject.json["id"])
           for photogroups in venue.json["photos"]["groups"]
               if photogroups["type"] == "venue"             
                 if photogroups["count"] > 0 and item.images.count == 0
                   for photoitem in photogroups["items"]
                     item.images << photoitem["url"]
                     for low_res in photoitem["sizes"]["items"]
                        if low_res["width"] == 300
                         item.low_res_images << low_res["url"]
                          puts low_res["url"]
                        end
                      end
                   end
                 end
               end
           end
           item.save
         end
         
       end #ends for         
       if item.foursqure_venue.nil?
          b = userless.venues.search(:ll => ll,:query=>item.title,:limit=>50)
           for fsObject in b.first.second
              titleSplit = item.title.downcase.strip.split(" ")
              fsTitleSplit = fsObject.json["name"].downcase.strip.split(" ")
              matchCount = 0
              for titleSegment in titleSplit
                for fsTitleSegment in fsTitleSplit
                  includedlocation = false
                   for location in locations
                     if location.downcase.include?titleSegment.downcase
                       includedlocation = true
                     end
                   end
                   for foodtype in foodtypes
                      if foodtype.downcase.include?titleSegment.downcase
                        includedlocation = true
                      end
                    end
                   if includedlocation
                     next
                   end
                  if titleSegment.strip == fsTitleSegment.strip
                    matchCount = matchCount + 1
                  end
                end
              end

              if matchCount > 1
                item.foursqure_venue = fsObject.json["id"]                
                 puts "["+item.title + "] found on 2nd pass ...[" + fsObject.json["name"]+"] id= "+ fsObject.json["id"]
                venue = foursquare.venues.find(fsObject.json["id"])
                for photogroups in venue.json["photos"]["groups"]
                    if photogroups["type"] == "venue"             
                      if photogroups["count"] > 0
                        for photoitem in photogroups["items"]
                          item.images << photoitem["url"]
                           puts photoitem["url"]                 
                           for low_res in photoitem["sizes"]["items"]
                              if low_res["width"] == 300
                               item.low_res_images << low_res["url"]
                                puts low_res["url"]
                              end
                            end         
                        end
                      end
                    end
                 end
                 item.save
              end
            end
       end
        if item.foursqure_venue.nil?
           b = userless.venues.search(:ll => ll,:query=>item.title,:limit=>50)
            for fsObject in b.first.second
               titleSplit = item.title.downcase.strip.split(" ")
               fsTitleSplit = fsObject.json["name"].downcase.strip.split(" ")
               matchCount = 0
               for titleSegment in titleSplit
                 for fsTitleSegment in fsTitleSplit
                   includedlocation = false
                    for location in locations
                      if location.downcase.include?titleSegment.downcase
                        includedlocation = true
                      end
                    end
                    for foodtype in foodtypes
                       if foodtype.downcase.include?titleSegment.downcase
                         includedlocation = true
                       end
                     end
                    if includedlocation
                      next
                    end
                   if titleSegment.strip == fsTitleSegment.strip
                     matchCount = matchCount + 1
                   end
                 end
               end
               if matchCount > 0 and item.foursqure_venue.nil?
                 item.foursqure_venue = fsObject.json["id"]
                 puts "["+item.title + "] found on 3nd pass ...[" + fsObject.json["name"]+"] id= "+ fsObject.json["id"]
                 venue = foursquare.venues.find(fsObject.json["id"])
                 for photogroups in venue.json["photos"]["groups"]
                     if photogroups["type"] == "venue"             
                       if photogroups["count"] > 0
                         for photoitem in photogroups["items"]
                           item.images << photoitem["url"]
                           puts photoitem["url"]
                           for low_res in photoitem["sizes"]["items"]
                              if low_res["width"] == 300
                               item.low_res_images << low_res["url"]
                                puts low_res["url"]
                              end
                            end
                         end
                       end
                     end
                  end
                  item.save
               end
             end
          end

          
     rescue 
    end
   end
   
   Instagram.configure do |config|
     config.client_id = "7c322e5fc93940358f93df9735ed5bec"
     config.access_token = "18393300.7c322e5.02c4345e7c4141f982acb8cac85a56ee"
   end
        for item in Item.where("foursqure_venue IS NOT NULL")
          begin           
         puts item.foursqure_venue
        a = Instagram.location_search(item.foursqure_venue)
        for i in Instagram.location_recent_media(a.first.id)
          item.images.unshift(i.images.standard_resolution.url)
          puts i.images.standard_resolution.url
          item.low_res_images.unshift(i.images.low_resolution.url)
          puts i.images.low_resolution.url
        end
        item.save  
       rescue
       end
      end
   
   
  end
  
 task :getInstagramPhotosWithFoursquare => :environment do  
  # All methods require authentication (either by client ID or access token).
  # To get your Instagram OAuth credentials, register an app at http://instagr.am/oauth/client/register/
  Instagram.configure do |config|
    config.client_id = "7c322e5fc93940358f93df9735ed5bec"
    config.access_token = "18393300.7c322e5.02c4345e7c4141f982acb8cac85a56ee"
  end
       for item in Item.where("foursqure_venue IS NOT NULL")
         begin           
        puts item.foursqure_venue
       a = Instagram.location_search(item.foursqure_venue)
       for i in Instagram.location_recent_media(a.first.id)
         item.images.unshift(i.images.standard_resolution.url)
         puts i.images.low_resolution.url
       end
       item.save  
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
 task :resetFoursqure_venue => :environment do
    for item in Item.all
      puts item.id
      item.foursqure_venue = nil;
      item.save
    end
  end
 task :removeDash => :environment do
   for item in Item.all
     a = item.title
     if a.include?"-"
        title = a.slice(0,a.index("-")).strip
        subtitle = a.slice(a.index("-")+1,a.length).strip
        item.title = title
        item.subtitle = subtitle
        item.save
     end
   end
 end
 
 task :removeColonFromSubtitle => :environment do
   for item in Item.all
     a = item.subtitle
     if a.include?":"
        subtitle = a.slice(a.index(":")+1,a.length).strip
        item.subtitle = subtitle
        item.save
     end
   end
 end
require 'open-uri'
page = "climb info"
file_name = "climb.txt"
web_page = open("http://www.mountainproject.com/scripts/Search.php?searchType=routeFinder&minVotes=0&selectedIds=105744246&type=rock&diffMinrock=800&diffMinboulder=20000&diffMinaid=70000&diffMinice=30000&diffMinmixed=50000&diffMaxrock=12300&diffMaxboulder=21400&diffMaxaid=75260&diffMaxice=38500&diffMaxmixed=60000&is_trad_climb=1&is_sport_climb=1&is_top_rope=1&stars=0&pitches=0&sort1=area&sort2=rating&printer=1")
output = File.open(file_name, "w")
output.puts "Route Name:: Difficulty::Climb Type, # Pitches (optional) MP Rating(optional)::Craig Name::Link"
begin
  while line = web_page.gets
      if line =~ %r{(href="(.*))(">(.*?)</).*(YDS'>(.*?)</).*('small'>(.*)</p></td><td).*(">(.*?)</)}
      output.puts "#{$4}::#{$6}::#{$8}::#{$10}::http://www.mountainproject.com#{$2}"
      end
  end
output.close
rescue Exception
  STDERR.puts "Failed to download #{page}: #{$!}"
  output.close
  File.delete(file_name)
  raise
end
output = File.open(file_name, "r")
file2_name = "climbcleaned.txt"
output2 = File.open(file2_name, "w")
begin
  while line = output.gets
    if line =~ /MP\s/
      output2.puts "Route Name::Difficulty::Climb Type(s), # Pitches (optional)::Craig Name::Web Link"
    elsif line =~ /,\s\d+&#\d+/
      line.sub!(/,\s\d+&#\d+;/, '')
      output2.puts line
    else
      output2.puts line
    end
  end
output.close
output2.close
end

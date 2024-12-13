function weather
  curl wttr.in/Ottawa > /tmp/ottawa_weather.txt; curl wttr.in/Nairobi > /tmp/nairobi_weather.txt; diff -u /tmp/ottawa_weather.txt /tmp/nairobi_weather.txt
end

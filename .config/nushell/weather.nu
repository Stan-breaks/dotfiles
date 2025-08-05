def weather [] {
  let cities = ["Ottawa", "Nairobi"]

  let weather_data = $cities | par-each {|city|
    {
      city: $city
      weather: (http get $"https://wttr.in/($city)?format=3")
    }
  }

  $weather_data
}


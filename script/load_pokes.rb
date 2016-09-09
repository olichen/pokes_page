require 'json'
require 'rest-client'

#load a specific poke from a url
def load_poke url
  output = JSON.parse(RestClient.get(url))
  if Poke.find_by(id: output['id'])
    Poke.update(output['id'],
      name: output['name'],
      weight: output['weight'],
      order: output['order'])
  else
    Poke.create(id: output['id'],
      name: output['name'],
      weight: output['weight'],
      order: output['order'])
  end
  print 'p' + output['id'].to_s + ' '
end

#begin loading data
pokes_list = JSON.parse(RestClient.get('http://pokeapi.co/api/v2/pokemon/'))
puts 'Loading ' + pokes_list['count'].to_s + ' pokemon...'

while(pokes_list) do
  pokes_list['results'].map{|p| Thread.new{load_poke(p['url'])}}
  pokes_list = JSON.parse(RestClient.get(pokes_list['next']))
end

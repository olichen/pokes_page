require 'json'
require 'rest-client'

verbose=1

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
response = RestClient.get('http://pokeapi.co/api/v2/pokemon/')
pokes_list = JSON.parse(response)

puts 'Loading ' + pokes_list['count'].to_s + ' Pokemon...' if verbose==1
print 'Pokemon 1 to 20: '  if verbose==1

while(response) do
  #load each poke in a separate thread
  #join them all to prevent bombarding the api
  thread = []
  pokes_list['results'].map{|p| thread << Thread.new{load_poke(p['url'])}}
  thread.each(&:join)

  if verbose==1
    pokenum = pokes_list['next'].split('=')[1].to_i
    print 'Pokemon' + (pokenum+1).to_s + ' to ' + (pokenum+20).to_s + ': '
  end

  response = RestClient.get(pokes_list['next']) 
  pokes_list = JSON.parse(response) if response
end

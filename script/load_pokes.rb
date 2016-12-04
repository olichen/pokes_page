require 'json'
require 'rest-client'

VERBOSE=1

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
  print 'p' + output['id'].to_s + ' ' if VERBOSE==1
end

#begin loading data
response = RestClient.get('http://pokeapi.co/api/v2/pokemon/')
pokes_list = JSON.parse(response)

puts 'Loading ' + pokes_list['count'].to_s + ' Pokemon...' if VERBOSE==1
print 'Pokemon 1 to 20: ' if VERBOSE==1

while(response) do
  ## threaded loads don't work because the database can't handle that many calls at once
  #load each poke in a separate thread
  #join them all to prevent bombarding the api
  #thread = []
  #pokes_list['results'].map{|p| thread << Thread.new{load_poke(p['url'])}}
  #thread.each(&:join)

  #load each poke into the db
  pokes_list['results'].map{|p| load_poke(p['url'])}

  if VERBOSE==1
    pokenum = pokes_list['next'].split('=')[1].to_i
    print "\nPokemon " + (pokenum+1).to_s + ' to ' + (pokenum+20).to_s + ': '
  end

  response = (pokes_list['next'] ? RestClient.get(pokes_list['next']) : nil)
  pokes_list = JSON.parse(response)
end

#destroy pokes that weren't loaded in the last day
Poke.where('updated_at < ?', Time.now.yesterday).map(&:destroy)

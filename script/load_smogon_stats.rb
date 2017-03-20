require 'json'
require 'rest-client'
require 'open-uri'

VERBOSE=1

def get_file url
  RestClient.get(url)
end

def find_or_create object, findhash, createhash
  output = object.where(findhash)
  if output.count > 1
    print "\nWARNING: more than one #{object} found for: "
    findhash.each{|k,v| print k + ' => ' + v + ', '}
  elsif output.count == 0
    return object.create(createhash)
  end
  return output.first
end

def load_json file, month
  output = JSON.parse(file)
  info = output['info']
  data = output['data']

  # find target datasmogon object
  datasmogon = find_or_create(DataSmogon,
    {metagame: info['metagame'], cutoff: info['cutoff']},
    {metagame: info['metagame'], cutoff: info['cutoff'],
      numbattles: info['number of battles'], month: month})

  # parse each poke
  print "Parsing #{info['metagame']}-#{info['cutoff'}:" if VERBOSE==1
  print '' if VERBOSE==1
  data.each do |name, stats|
    # find target poke
    poke = find_or_create(Poke,
      {name: name}

    datapoke = DataPoke.where(data_smogon_id: datasmogon.id, poke_id: 
  end
end

# f = File.read('../../Downloads/gen7pokebankou-1825.json')

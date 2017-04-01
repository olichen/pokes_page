require 'json'
require 'rest-client'
require 'open-uri'

VERBOSE=1

def get_file url
  RestClient.get(url)
end

def find_or_create object, findhash, createhash = nil
  output = object.where(findhash)
  if output.count > 1
    print "\nWARNING: more than one #{object} found for #{findhash}" if VERBOSE==1
  elsif output.count == 0
    createhash = findhash if createhash.blank?
    print "\n#{object} #{createhash} is being created" if VERBOSE==1
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
      num_battles: info['number of battles'], month: month})

  # parse each poke
  print "Parsing #{info['metagame']}-#{info['cutoff']}..." if VERBOSE==1
  print '' if VERBOSE==1
  data.each do |poke_name, poke_stats|
    poke_name = poke_name.downcase
    print '.' if VERBOSE==1
    # find or create poke
    poke = find_or_create(Poke, {name: poke_name})
    # datapoke object
    datapoke = find_or_create(DataPoke, {poke_id: poke.id},
      {data_smogon_id: datasmogon.id, poke_id: poke.id, count: data['Raw count'], usage: data['usage']})
    # abilities
    poke_stats['Abilities'].each do |ab_name, ab_usage|
      ability = find_or_create(Ability, {name: ab_name})
      find_or_create(DataPokeAbility, {ability_id: ability.id, data_poke_id: datapoke.id, usage: ab_usage})
    end
    # items
    poke_stats['Items'].each do |it_name, it_usage|
      item = find_or_create(Item, {name: it_name})
      find_or_create(DataPokeItem, {item_id: item.id, data_poke_id: datapoke.id, usage: it_usage})
    end
    # teammates
    poke_stats['Teammates'].each do |tm_name, tm_usage|
      next if tm_usage == 0
      teammate = find_or_create(Poke, {name: tm_name})
      find_or_create(DataPokeTeammate, {poke_id: teammate.id, data_poke_id: datapoke.id, usage: tm_usage})
    end
    # moves
    poke_stats['Moves'].each do |mv_name, mv_usage|
      next if mv_usage == 0
      move = find_or_create(Move, {name: mv_name})
      find_or_create(DataPokeMove, {move_id: move.id, data_poke_id: datapoke.id, usage: mv_usage})
    end
    # viability
    vi = poke_stats['Viability Ceiling']
    find_or_create(DataViability, {data_poke_id: datapoke.id},
        {data_poke_id: datapoke.id, numplayers: vi[0], gxe_top: vi[1], gxe_99: vi[2], gxe_95: vi[3]})
  end
end

f = File.read('../../Downloads/gen7pokebankou-1825.json')
load_json(f, Date.new(2017,1,1))

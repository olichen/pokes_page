require 'json'
require 'rest-client'
require 'open-uri'

VERBOSE=1

def get_file url
  RestClient.get(url)
end

def load_json file, month
  output = JSON.parse(file)
  info = output['info']
  data = output['data']
  datasmogon = DataSmogon.where(metagame: info['metagame'], cutoff: info['cutoff'])
  if datasmogon.count > 1
    print "WARNING: more than one object found for #{info['metagame']}-#{info['cutoff']}"
  elsif datasmogon.count == 0
    datasmogon = DataSmogon.create(
      metagame: info['metagame'],
      cutoff: info['cutoff'],
      numbattles: info['number of battles'],
      month: month)
  else
    datasmogon = datasmogon.first
  end
  print "Parsing #{info['metagame']}-#{info['cutoff'}:" if VERBOSE==1
end

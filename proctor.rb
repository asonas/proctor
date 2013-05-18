require "net/http"
require "uri"

class Proctor
  def self.get(record)
    path = case record
    when Favorite
      Settings.proctor.reaction[record.object_type]
    when Comment
      Settings.proctor.reaction[record.object_type]
    end % record.object_id

    uri = URI.parse(Settings.proctor.api_host + path)

    response = Net::HTTP.start(uri.host, uri.port) { |http|
      header = {}

      http.get(uri.path + uri.query, header)
    }
    response
  end
end

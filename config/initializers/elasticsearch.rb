Elasticsearch::Model.client = Elasticsearch::Client.new(
  host: "http://localhost:9200/",
  # user: ENV['ELASTICSEARCH_USER'],
  # password: ENV['ELASTICSEARCH_PASSWORD']
)
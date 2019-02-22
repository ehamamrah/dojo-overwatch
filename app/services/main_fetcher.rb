class MainFetcher
  attr_reader :link, :model

  def initialize(attributes = {})
    @link  = attributes[:link]
    @model = Class.const_get("#{self.class.to_s.gsub('Fetcher', '')}")
  end

  def perform
    overwatch_request = Net::HTTP.get(URI(link))
    records           = JSON.parse(overwatch_request)
    fetched_records   = records['data']
    saved_records     = model.all
    return if fetched_records.count.eql?(saved_records.count)
    start_fetching_records(fetched_records)
  end

  private

  def start_fetching_records(records)
    records.map { |record| record_parsed_details(record) }
  end

  def record_parsed_details(record_details)
    record_details.delete('url')
    record_api_id = record_details.delete('id')
    record = model.find_or_initialize_by(overwatch_id: record_api_id)
    save_record_details(record, record_details, record_api_id)
  end
end

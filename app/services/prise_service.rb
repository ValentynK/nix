class PriseService
  INITIAL_PRICE = 0.001.freeze
  IMAGE_FILE_SIZE = 0.01.freeze
  IMAGE_CONTENT_TYPE = 0.005.freeze

  attr_reader :record, :rule

  def self.generate_prise(record)
    new(record).create_prise
  end

  def initialize(record)
   @record = record
  end

  def create_prise
   rule = BillingRulle.find_by(default: true)
   prise = rule.price
   prise += rule.big_size_price if record.image_file_size > 100.kilobyte()
   prise += rule.giff_price if record.image_content_type == "image/gif"
   record.price = prise
  end
end
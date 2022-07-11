class ShaManager < ApplicationRecord
  include Constants
  validates :path, presence: true

  def self.get_record(path, record_to_pick)
    record_to_pick = record_to_pick.abs
    return nil unless (0...MAX_DATA_TO_STORE).cover?(record_to_pick)

    ShaManager.where(path: path).order("id desc").offset(record_to_pick).first
  end
end

class ShaCleaner
  include Constants
  def self.delete_stale_data_for(path)
    data = ShaManager.where(path: path)
    return if data.count <= MAX_DATA_TO_STORE

    data.order("id desc").offset(MAX_DATA_TO_STORE).destroy_all
  end
end

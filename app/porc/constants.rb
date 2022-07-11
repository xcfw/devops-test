module Constants
  MAX_DATA_TO_STORE = ENV["MAX_DATA_TO_STORE"].to_i.zero? ? 3 : ENV["MAX_DATA_TO_STORE"]
end

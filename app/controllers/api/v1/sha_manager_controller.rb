class Api::V1::ShaManagerController < ApplicationController
  include Constants
  def create
    sha_parser = ShaParser.new(params[:path])
    sha_manager = ShaManager.new(path: sha_parser.source, sha: sha_parser.sha)
    if sha_manager.save
      ShaCleaner.delete_stale_data_for(sha_parser.source)
      render json: sha_parser.to_string.to_json
    else
      render json: {message: "Error!"}, status: :unprocessable_entity
    end
  end

  def show
    record_to_pick = params[:get] || 0
    sha_parser = ShaParser.new(params[:path])
    sha_object = ShaManager.get_record(sha_parser.source, record_to_pick.to_i)
    if sha_object
      render json: sha_object.sha
    else
      render json: {message: "Not found"}.to_json, status: 404
    end
  end
end

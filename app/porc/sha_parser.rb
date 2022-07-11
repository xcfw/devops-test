class ShaParser
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def sha
    get_pieces[:img_name].split(":").last
  end

  def source
    [
      get_pieces[:repo],
      get_pieces[:branch],
      get_pieces[:img_name].split(":").first
    ].join("/")
  end

  def to_string
    "Repo - #{get_pieces[:repo]}; Branch - #{get_pieces[:branch]}; Img Name - #{get_pieces[:img_name]}"
  end

  def get_pieces
    repo, branch, img_name = path.split("/")
    {
      repo: repo,
      branch: branch,
      img_name: img_name
    }
  end
end

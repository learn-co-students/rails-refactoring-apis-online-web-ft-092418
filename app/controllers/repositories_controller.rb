class RepositoriesController < ApplicationController
  def index
    @repos_array = JSON.parse(GithubRepo.new(params).index(session).body)
  end

  def create
    response = GithubRepo.new(params).new_repo(session)
    binding.pry
    redirect_to '/'
  end
end

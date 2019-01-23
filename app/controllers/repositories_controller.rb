class RepositoriesController < ApplicationController
  def index
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # @repos_array = JSON.parse(response.body)
    github = GithubService.new(session)
    @username = github.get_username
    @repos_array = github.get_repos
  end

  def create
    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    github = GithubService.new(session)
    github.create_repo(params[:name])
    redirect_to '/'
  end
end

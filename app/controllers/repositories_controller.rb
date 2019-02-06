class RepositoriesController < ApplicationController
  def index
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # @repos_array = JSON.parse(response.body)


    github = GithubService.new({"access_token" => session[:token]})
    @repos_array = github.get_repos
  end

  def create
    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    github = GithubService.new({"access_token": session[:token]})    
    github.create_repo(params[:name])
    redirect_to '/'
  end
end

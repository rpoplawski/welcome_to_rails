class UsersController < ApplicationController

def index
  users = User.all
  mapped_users = users.map do |user|
    "#{user.first_name}, #{user.last_name}, #{user.age}"
  end
  render text: "#{mapped_users}"
end

  def show
    begin
      any_user = User.find(params[:id])
      render text: "params: #{params.inspect} user: #{any_user.first_name}, #{any_user.last_name}, #{any_user.age}", status: 200
    rescue ActiveRecord::RecordNotFound
      render text: "Sorry, user with id of #{params[:id]} was not found", status: 404
    end
  end
end

###############
#if @params[:id] != nil
#    if User.exists?(@params[:id]) == false
#     puts "Error 404. Requested user could not be found."
#    else
#      any_user = User.find(@params[:id])
#      puts "#{any_user.first_name}, #{any_user.last_name}, #{any_user.age}"
#    end
#  elsif
#    @users = User.all
#    @users.each do |user|
#    puts "#{user.first_name}, #{user.last_name}, #{user.age} "
#  end
#    puts "Message 200"
#  end
#################
#def index
#    time = Time.now
#    user = User.first
#    if user.nil?
#      render text: 'no first user', status: 404
#    else
#      render text: """Hello World,
#        thank you for visiting at #{time},
#        the first user in my database is #{user.full_name}""", status: 200
#    end
#  end
#
#  def show
#    begin
#      user = User.find(params[:id])
#      render text: "params: #{params.inspect} user: #{user.full_name}", status: 200
#    rescue ActiveRecord::RecordNotFound
#      render text: "Sorry, user with id of #{params[:id]} was not found", status: 404
#    end
#  end
#end

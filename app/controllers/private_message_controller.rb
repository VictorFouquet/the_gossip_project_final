class PrivateMessageController < ApplicationController
	
	def new
		@private_message = PrivateMessage.new
		@recipient = User.find(params[:user_id])
	end

	def create
		private_message = PrivateMessage.new(
			sender: current_user,
			recipient: User.find(params[:recipient_id]),
			content: params[:content],
			date: DateTime.now
			)
		private_message.save
		redirect_to user_private_message_path(user_id: current_user.id, id: private_message.recipient.id)
	end

	def index
		@user = current_user
		@user_sent_messages = @user.sent_messages
		@user_received_messages = @user.received_messages
		@user_conversations = []
		@user_sent_messages.each do |user_sent_message|
			@user_conversations << user_sent_message.recipient.email
		end
		@user_received_messages.each do |user_received_message|
			@user_conversations << user_received_message.sender.email
		end
		@user_conversations.uniq!
	end

	def show
		@user = current_user
		@recipient = User.find(params[:id])
		@messages = (@user.sent_messages.where(recipient: @recipient) + @user.received_messages.where(sender: @recipient)).flatten.sort_by{|message| message[:date]}
		@messages = @messages.reverse
	end

end
# One-page guestbook: the index shows the sign form above the wall of
# messages, newest first. Posting a message renders the same page with the
# new entry at the top of the wall. No accounts, no moderation surface —
# the smallest thing the foundation allows.
class GuestbookController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.wall.limit(100)
  end

  def create
    @message = Message.new(message_params)
    @messages = Message.wall.limit(100)

    if @message.save
      redirect_to root_path, notice: "Signed the guestbook."
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :body)
  end
end

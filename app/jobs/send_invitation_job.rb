class SendInvitationJob < ActiveJob::Base
  queue_as :email

  def perform(invitation)
    # Do something later
    InvitationMailer.invite(@invitation).deliver_now
  end
end

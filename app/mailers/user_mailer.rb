class UserMailer < ApplicationMailer

  def signup_email(user)
    @user=user
    mail( to: @user.email, subject: 'Thanks for signing up' )
  end
  def tag_email(user,article)
    @user=user
    @article=article
    mail( to: user.email, subject: 'You are tagged in a post' )
  end
end
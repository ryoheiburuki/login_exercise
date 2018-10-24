class ContactMailer < ApplicationMailer
  def confirm_mail(blog)
    @blog = blog
    mail to: @blog.user.email, subject:"ブログの投稿確認"
  end
end

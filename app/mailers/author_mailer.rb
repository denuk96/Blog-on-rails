class AuthorMailer < ApplicationMailer

  def registration_confirmation(author)
    @author = author
    mail to: author.email, subject: "Registration Confirmation"
  end

  def greatings(author)
    @author = author
    mail to: author.email, subject: "hello there"
  end

end

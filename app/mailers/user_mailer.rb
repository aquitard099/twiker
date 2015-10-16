class UserMailer < ApplicationMailer
	default from: "sanper@outlook.com"
    layout 'mailer'

	def welcome(name, email)
		@name = name
		mail(to:email, subject: "Bienvenido a mi bella aplicacion.")
	end
end

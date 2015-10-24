class UserMailer < ApplicationMailer
	default from: "sanper@outlook.com"
    layout 'mailer'

	def welcome(name, email)
		@name = name
		mail(to:email, subject: "Bienvenido a mi bella aplicacion.")
	end

	def update(name, email)
		@name = name
		mail(to:email, subject: "Tu cuenta ha sido editada.")
	end
end

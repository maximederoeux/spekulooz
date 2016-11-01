class UserMailer < ApplicationMailer

	def resa_resto_email(reservation)
		@reservation = reservation
    mail(
    	to: @reservation.account.email,
    	subject: I18n.t('mail.resa_resto_title')
      )
  end

	def resa_client_email(reservation)
		@reservation = reservation
    mail(
    	to: @reservation.email,
    	subject: I18n.t('mail.resa_resto_title')
      )
  end

end
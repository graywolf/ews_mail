Gem::Specification.new do |s|
	s.name = 'ews_mail'
	s.version = '1.0.2'
	s.date = Time.now.strftime '%Y-%m-%d'
	s.summary = 'Send simple mails via EWS'
	s.description = <<~HEREDOC
		Send mails via EWS, useful for corporation environment
		like ours which has outlook via office365, but firewall
		block SMTP (don't ask me why, dunno).
		HEREDOC
	s.author = 'Gray Wolf'
	s.email = 'wolf@wolfsden.cz'
	s.files = ['lib/ews_mail.rb']
	s.homepage = 'https://github.com/graywolf/ews_mail'
	s.license = 'MIT'

	s.add_runtime_dependency 'savon', '~> 2.0'
end

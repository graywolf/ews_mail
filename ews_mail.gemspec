require_relative 'lib/ews_mail.rb'

Gem::Specification.new do |s|
	s.name = 'ews_mail'
	s.version = EWS::Mail::VERSION
	s.date = Time.now.strftime '%Y-%m-%d'
	s.summary = 'Send simple mails via EWS'
	s.description = <<~HEREDOC
		Send mails via EWS, useful for corporation environment
		like ours which has outlook via office365, but firewall
		block SMTP (don't ask me why, dunno).
		HEREDOC
	s.author = 'Tomas Volf'
	s.email = 'tv185035@ncr.com'
	s.files = ['lib/ews_mail.rb']
	s.homepage = 'https://github.com/graywolf/ews_mail'
	s.license = 'MIT'

	s.add_runtime_dependency 'savon', '~> 2.0'
end

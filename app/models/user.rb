class User < ActiveRecord::Base
	LIME_EMAIL_REGEX = /\A[\w+\-.]+@(time4)?lime+\.com+\z/i
  	validates :email, presence: true, format: {with: LIME_EMAIL_REGEX, message: "is not a vaild LIME address"}, uniqueness: {case_sensitive: false}
  	validates :username, presence: true, uniqueness: {case_sensitive: false}
  	
  	def self.authorize(username, password)
  		#this should return the user after it goes and authenticate 
  		#using the domain active directory an if we can find them in our database  
  		find_by_username(username) if ad_authenticate?(username,password) 
  	end
  	# Validates email/password combination against the LDAP and return true if creds are correct
    # @param [String] email of the user
    # @param [String] password of the user
    # @return [Boolean] the resulting User object
    def self.ad_authenticate?(username, password)
      #authenticate against lime ad
      require "net/ldap"
      domain = "cwwi" #APP_CONFIG[:domain]
      ldap = Net::LDAP.new
      ldap.host =  "jams001.cwwi.cwintra.com" #APP_CONFIG[:ldap_host]
      ldap.port = "389" #APP_CONFIG[:ldap_port]
      ldap.auth "#{domain}\\#{username}", "#{password}"
      ldap.bind
    end
end

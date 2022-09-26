class User < ApplicationRecord

    validates_uniqueness_of :username

    def self.generate
        adjectives = ['blue', 'red', 'yellow', 'black', 'green']
        nouns = ['lion', 'fox', 'elephant', 'hippo', 'rat']
        number = rand.to_s[2..4]
        username = "#{adjectives.sample}_#{nouns.sample}_#{number}"
        User.create(username: username)

    end

end

require "pman/version"
require 'yaml'

module Pman
  PASSWORD_PATH = 'passwords.yml'

  class << self
    def generate(app, length=8)
      password = generate_password(length)
      persist_password app, password
    end

    def generate_password(length=8)
      s = 2                       # length of special chars
      a = n = (length - s) / 2    # length of alpha and numeric chars

      # add 1 to alpha length since length is odd
      a += 1 if length % 2 == 1

      str = ('a'..'z').to_a.shuffle[0, a].join
      str += (1..9).to_a.shuffle[0, n].join
      str += ['-', '_', '!', '+', '*'].shuffle[0, 2].join

      str.split('').shuffle[0, length].join
    end

    def persist_password(app, password)
      config = YAML.load_file(PASSWORD_PATH) rescue {}
      config[app] = password

      File.open('passwords.yml','w+') do |passwords|
         passwords.write config.to_yaml
      end
    end
  end
end

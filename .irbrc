require 'irb/completion'
require 'brice/init'
require 'awesome_print'

def unbundled_require(gem)
  loaded = false

  if defined?(::Bundler)
    Gem.path.each do |gems_path|
      gem_path = Dir.glob("#{gems_path}/gems/#{gem}*").last
      unless gem_path.nil?
        $LOAD_PATH << "#{gem_path}/lib"
        require gem
        loaded = true
      end
    end
  else
    require gem
    loaded = true
  end

  raise(LoadError, "couldn't find #{gem}") unless loaded

  loaded
end

def load_gem(gem, &block)
  begin
    if unbundled_require gem
      yield if block_given?
    end
  rescue Exception => err
    warn "Couldn't load #{gem}: #{err}"
  end
end

# Improved formatting for collections
load_gem 'hirb' do
  Hirb.enable
end

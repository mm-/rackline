module Rackline

 class ServerFind

  include Methadone::CLILogging
  include Methadone::SH
  include Methadone::Main

  def initialize(name)
    @name=name
  end

  def byname
    cs=$cs
    cs.servers_detail.each do |s|
      name = s[:name].to_s
      id = s[:id].to_s
      tag = @name 
      if name.match(/#{tag}/)
        puts name + " -- " + id
      end
    end
  end

  def byname_idonly
    cs=$cs
    cs.servers_detail.each do |s|
      name = s[:name].to_s
      id = s[:id].to_s
      tag = @name 
      if name.match(/#{tag}/)
        puts id
      end
    end
  end
 end
end

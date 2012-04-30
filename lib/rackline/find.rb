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

  def byname_fullinfo
    cs=$cs
    cs.servers_detail.each do |s|
      name = s[:name].to_s
      status = s[:status].to_s
      id = s[:id].to_s
      pub_ip = s[:addresses][:public].to_s.gsub(/([\[\]\"])/, '')
      priv_ip = s[:addresses][:private].to_s.gsub(/([\[\]\"])/, '')      
      metadata = s[:metadata].to_s
      host_id = s[:hostId].to_s
      image_id = s[:imageId].to_s
      progress = s[:progress].to_s
      tag = @name 
      if name.match(/#{tag}/)
        puts 
        printf "%-20s %s\n", "Name", name
        puts '=' * 50
        printf "%-20s %s\n", "Status", status + " (" + progress + ")"
        printf "%-20s %s\n", "Metadata", metadata        
        printf "%-20s %s\n", "ID", id        
        printf "%-20s %s\n", "Host ID", host_id
        printf "%-20s %s\n", "Image ID", image_id 
        printf "%-20s %s\n", "Public IP", pub_ip
        printf "%-20s %s\n", "Private IP", priv_ip
        ts=$cs.server(id)
        backups = ts.backup_schedule
        if backups[:enabled]
          daily = backups[:daily]
          weekly = backups[:weekly]
          printf "%-20s %s\n", "Backups", "Enabled"
          printf "%-20s %s\n", "Schedule:", "vvvvvv"
          printf "%-20s %s\n", "Daily", daily
          printf "%-20s %s\n", "Weekly", weekly          
        else
          printf "%-20s %s\n", "Backups", "Disabled"
        end
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

#!/usr/bin/env ruby
# coding: utf-8
#
# @Author Franck WIATROWSKI - 2017

entry_ok = false

while entry_ok != true
print "Enter a folder path: "
entry = gets.chomp
    if entry == "#{ENV['HOME']}" || entry == "/" || Dir.exists?(entry) == false
        case entry
	    when "#{ENV['HOME']}"
	      puts "Home Folder not allowed"
	    when "/"
	      puts "Root path not allowed"
            else
	      puts "Folder not found"
	 end
    else
      entry_ok = true
    end
end

d = Dir[entry+'/**/']
d.each do |e|
    u = 0
    Dir[e+'*'].reject{|f| File.basename(f).include?(".rb") || [".",".."].include?(f) || File.directory?(f)}.sort.each do |x|   
        File.rename(File.absolute_path(e)+'/'+File.basename(x), File.absolute_path(e)+'/'+u.to_s+'-'+File.basename(x))
        u = u+1
    end
end

puts "Success"

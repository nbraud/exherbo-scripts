#!/usr/bin/ruby
# Copyright 2013 Nicolas Braud-Santoni <nicolas+exherbo@braud-santoni.eu>
# Distributed under the terms of the ISC license

require 'resolv'
require 'uri'

@head = nil

def complain text
  $stderr.puts @head unless @head.nil?
  @head = nil
  $stderr.puts "    %s"%text
end

while !(line = gets).nil?
  mirror = line.split
  next if mirror.empty?

  if mirror[0][0] == '#' #This line is a comment
    puts line
    next
  end

  name = mirror.shift
  @head = "Mirror '%s'"%name

  mirror.select! { |text|
    uri = URI(text)

    if uri.host.nil?
      complain "URI '%s' has no host"%text
    elsif !["http", "https", "ftp"].include?(uri.scheme)
      complain "URI '%s' uses an unsupported scheme"%text
    elsif Resolv.getaddresses(uri.host).empty?
      complain "Host '%s' doesn't resolve."%host
    else
      true
    end
  }

  if mirror.empty?
    complain "'%s' has no valid host"%name
  else
    puts "%s		%s"%[name, mirror.join(' ')]
  end
end

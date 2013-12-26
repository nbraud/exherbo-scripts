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
  line = line.split
  next if line.empty?

  name = line.shift
  valid_hosts = []
  @head = "Mirror '%s'"%name

  line.each { |text|
    uri = URI(text)

    host = uri.host
    complain "'%s' is too fishy (no host)"%text if host.nil?
    next if host.nil?

    if Resolv.getaddresses(host).empty?
      complain "Host '%s' doesn't resolve."%host
    else
      valid_hosts << text
    end
  }

  if valid_hosts.empty?
    complain "'%s' has no valid host"%name
  else
    puts "%s		%s"%[name, valid_hosts.join(' ')]
  end
end

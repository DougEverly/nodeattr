require "nodeattr/version"

require 'OptParse'

class NodeAttr
  
  attr_accessor :genders
  
  def initialize(filename = nil)
    
    @genders = Hash.new { |hash, key| hash[key] = [] }
    
    if not filename.nil?
      file = File.readlines(filename)
    elsif File.exists?('~/.genders')
      file = File.readlines('~/.genders')
    elsif File.exists?('/etc/genders')
      file = IO.readlines('/etc/genders', "\n")
    end
    load file

  end
  
  def load(file)
    file.each do |line|
      nodes = []
      next if line =~ /^#/
      next if line =~ /^\s+$/
      line.chomp!
      nodes_part, genders_part = line.split(/\s+/)
      nodes << explode_nodes(nodes_part)
      # puts genders_part
      if genders_part
        genders = genders_part.split(',')
        genders.each do |gender|
          @genders[gender] = @genders[gender] + nodes.flatten
        end
      end
    end
  end
  
  def explode_nodes(nodes)
    h = Array.new
    m = nodes.match(/^(.*)\[(.*)\]$/)
    if m
      base = m[1]
      instances = m[2].split(',')
      instances.each do |i|
        if i.match(/-/)
          left, right = i.split('-')
          padding = left.match(/^0+/)
          (left.to_i .. right.to_i).each do |j|
            h << sprintf("%s%0#{padding.to_s.length + 1}d", base, j)
          end
        else
          padding = i.match(/^0+/).size - 1
          if padding.size > 1
            pad = '0' * (padding.size -1)
          end
          h << sprintf("%s%0#{padding.to_s.length + 1}d", base, j)
        end
      end
    end
    h
  end
  
  def query(filter)
    if @genders.has_key?(filter)
      @genders[filter] 
    else
      []
    end
  end
  
end

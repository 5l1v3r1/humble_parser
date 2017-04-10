#!/usr/bin/ruby
require 'nokogiri'
require 'uri'

=begin

## Element object structure after parsing

Should only need the data-web attribute, which contains the download URL.

	#<Nokogiri::XML::Element:0x2b05bc3c2688
		name="a"
		attributes=[

			#<Nokogiri::XML::Attr:0x2b05bc3c25d4
				name="class"
				value="a">,

			#<Nokogiri::XML::Attr:0x2b05bc3c25c0
				name="href"
				value="https://dl.humble.com/gettingstartedwithnetduino1.mobi?gamekey=7nxBtuBS4Vks6UyP&ttl=1488554115&t=55c125db802c335e5887303126472f35">,

			#<Nokogiri::XML::Attr:0x2b05bc3c25ac
				name="data-web"
				value="https://dl.humble.com/gettingstartedwithnetduino1.mobi?gamekey=7nxBtuBS4Vks6UyP&ttl=1488554115&t=55c125db802c335e5887303126472f35">,

			#<Nokogiri::XML::Attr:0x2b05bc3c2598
				name="data-bt"
				value="https://dl.humble.com/torrents/gettingstartedwithnetduino1.mobi.torrent?gamekey=7nxBtuBS4Vks6UyP&ttl=1488554115&t=cef68812b999648fc1d1d31d12d8e9d4">,

			#<Nokogiri::XML::Attr:0x2b05bc3c2584
				name="target"
				value="_blank">]

		children=[#<Nokogiri::XML::Text:0x2b05bc3c19cc "\n        MOBI\n      ">]
	>

=end

filename = __FILE__.split('/')[-1]
usage = "usage: ruby #{filename} <humble_bundle.html> <outfile.txt>"

puts

begin

	infile = ARGV[0]
	outfile = ARGV[1]

	raise usage if !infile or !outfile

	urls = []

	doc = File.open(infile) { |f| Nokogiri::XML(f) }

	print "[+]  Parsing #{infile}...."

	doc.xpath('//a[@target="_blank" and @data-web and @data-bt]').each do |element|

		url = element.xpath('@data-web')
		urls << url.first.value if url.first.respond_to?(:value)
			
	end

	puts "done!"

	print "[+]  Writing urls to #{outfile}..."

	File.open(outfile,'w+') {|f| f.puts(urls)}

	puts "done!"

	puts

rescue => e

	if e.message == usage

		puts e.message

	else

		puts "[+]  Error: #{e.message}"
		puts "[+]  Backtrace:\n\n"
		puts e.backtrace

	end

end

puts
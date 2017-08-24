#!/usr/bin/ruby

require 'nokogiri'
require 'net/https'

class String

    def prefix(symbol='+', wrapper=["[","]"], space_char=" ", rep=1)

        return (wrapper[0] + symbol + wrapper[1]) + (space_char * rep) + self

    end

end

=begin

Purpose: Parses post-rendered HTML content for download URLs and proceeds to download
  each item while saving it to an output directory

Logic Flow:

1. Extract rendered HTMl source code (see the series of bullets below)
2. Paste the HTML content below the __END__ keyword

Extract the post-rendered html code by

1. Visiting the web page
  - Must be a download page for a particular bundle
  - Can find individual bundles by logging in and visiting /home/purchases
  - URL will look similar to the following, except without the XXX argument:
      https://www.humblebundle.com/downloads?key=XXXXXXXXXXXXXXXX
2. CTRL+SHIFT+I to inspect the page
3. View the root HTML element and select "Edit as HTML"
4. Select and copy all the HTML and paste it below __END__
5. Run the script

Sample Link: https://dl.humble.com/battlestargalacticaandphilosophy.mobi?gamekey=XXXXXXXXXXXXXXXX&ttl=1502225343&t=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

=end

# TODO: Stop being lazy and create a THOR interactive commandline
# Options: output_directory, input_file, download toggle (only extract links)
# output_directory = ''
# input_file = ''
# download_toggle = true

# determines if files should be downloaded
download_toggle = true

# destination directory for downloaded files
output_directory = 'downloads'

# dictionary of extracted uris
# key = filename
uris = {}

# create a Nokogiri document from the DATA io object
puts
print "Parsing DATA...".prefix
noko = Nokogiri::XML(DATA)
puts "done!"

# query the document for all links and iterate over each one
noko.xpath('//a').each do |ele|

  # extract the value of the href attribute
  href = ele.attributes["href"]

  # determine if it's a download link
  if href.respond_to?(:content) and href.content =~ /dl\.humble/

    # convert the content to a URI object
    uri = URI(href.content)

    # extract the filename from the path
    filename = uri.path.gsub('/','')

    # add the uri to the dict
    uris[filename] = uri

  end

end

download_toggle = false

if download_toggle

  if !Dir::entries('.').include?(output_directory)

    print "Creating output directory: #{output_directory}".prefix
    Dir::mkdir(output_directory)
    puts "...done!"

  end

  puts "Downloading files...".prefix
  puts

  uris.each do |filename, uri|

    puts "\t"+filename

    # download the file
    response = Net::HTTP.get_response(uri)

    # write the file to disk
    File::open(output_directory+'/'+filename, 'wb') { |outfile| outfile.write(response.body) }

  end

else

  puts "Downloading disabled, printing uris...".prefix
  puts

  uris.each { |filename, uri| puts "\t#{filename}:\t"+uri.to_s }

end

puts
puts "All links processed".prefix
puts "exiting...".prefix()
puts

# TODO: command line option for input file
__END__
<html>
  <body>HTML SHOULD GO HERE!</body>
</html>
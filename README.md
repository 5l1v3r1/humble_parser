# Humble Parser

Parses the HTML of a humble bundle purchase link, extracting individual download links for each file

# Issues

It seems to miss an arbitrary link now and then. Make sure that a link for each file name and format is captured.

# Dependencies

sudo apt-get install libxml2 libxml2-dev libxslt1-dev libxslt1.1
sudo gem install nokogiri

# Extract & Parse Download URLs from Humble Bundle HTML

Authenticate to humble bundle
Save the HTML source from the download page
From your browser session, extract the session token named _simpleauth_sess and save it to a file named cookies
Update the infile variable of this ruby script to point at the HTML source
Update the outfile variable of this ruby script to the name of the file to receive the parsed urls

# Downloading the files

Use the following Bash script to download the files

    mkdir bundle_download
    for u in $(cat humble_urls.txt)
    do n=$(echo $u|sed -r -e 's/^.+\/|\?.+$//g')
    wget --cookies cookies -O bundle_download/$n $u
    done

# Purpose

Using post-rendered HTML content from a Humble Bundle download page as input, parse the HTML and download each of the specified files.

# Dependencies

Install dependencies by...

    git clone https://github.com/arch4ngel/humble_parser
    cd humble_parser
    sudo gem install bundler
    sudo bundle install

# Usage

1. Extract HTML source (see following section)
2. Paste HTML content below ```__END__``` keyword
3. Run the script via ```ruby humble_parser.rb```

## Notes

- Just parse out the links by setting the ```download_toggle``` variable to ```true```
- Alter the download directory by updating the ```output_directory``` variable

## Extracting the post-rendered HTML source

__Note:__ By post-rendered, I mean after JavaScript has executed in a web browser, which patches up all the download links.

1. Visiting the web page
  - Must be a download page for a particular bundle
  - Can find individual bundles by logging in and visiting /home/purchases
  - URL will look similar to the following, except without the XXX argument:
      https://www.humblebundle.com/downloads?key=XXXXXXXXXXXXXXXX
2. CTRL+SHIFT+I to inspect the page
3. View the root HTML element and select "Edit as HTML"
4. Select and copy all the HTML and paste it below __END__
5. Run the script

# To Do

- Stop being lazy and script up an interface

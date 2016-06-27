require 'bookmarks'

namespace :bookmarks do
  desc "Import a bookmarks archive from Delicious service export."
  task import: :environment do
  	if ENV['source_file'].blank?
      puts "Source file required as command a line argument. (ex: source_file='relative path to file')"
      return
    end

    begin
	  	document = Bookmarks::Document.new format: :delicious
	  	document.parse ENV['source_file']	  	
	  rescue Exception => e
	  	puts "Error parsing data: #{e.message}"
    end
		
		unless document.nil?
			document.bookmarks.each do |b|
				puts b
				new_tags = b.tags.split(',').collect do |item|
					Tag.find_or_create_by(name: item)
				end
				# TODO: consider using find_or_create_by() to facilitate updating prexisting bookmarks
				new_bookmark = Bookmark.create({url: b.url, title: b.title, private: b.private_flag, created_at: b.date, updated_at: Time.now.to_s, comment: b.description})
				new_bookmark.tags << new_tags
				new_bookmark.save
				puts new_bookmark
			end
		end
  end
end
# ENV['source_file'], ENV['overwrite']
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
			if ENV['user_email']
				current_user = User.where({email: ENV['user_email']}).first_or_create
			end

			document.bookmarks.each do |b|
				puts b
				new_tags = b.tags.split(',').uniq.collect do |item|
					Tag.find_or_create_by(name: item.strip.downcase)
				end

				if current_user
					new_bookmark = Bookmark.owned_by(current_user).where({url: b.url}).first_or_create
					new_bookmark.update({title: b.title, private: b.private_flag, created_at: b.date, updated_at: Time.now.to_s, comment: b.description})
				else
					new_bookmark = Bookmark.where({url: b.url, title: b.title, private: b.private_flag, created_at: b.date, updated_at: Time.now.to_s, comment: b.description}).first_or_create
				end
				new_bookmark.tags = (new_bookmark.tags + new_tags).uniq
				new_bookmark.save
				puts new_bookmark
			end
		end
  end
end
# ENV['source_file'] ENV['user_email'] ENV['overwrite']
class Gist < ActiveRecord::Base
	belongs_to :user
	validates :snippet, :lang, :presence => true
	def self.search(snippet_search,desc_search,lang_search,page)
	paginate(:page => page, :per_page => 10, :conditions => ['user_id LIKE ? AND snippet LIKE ? AND description LIKE ? AND lang LIKE ?', "%#{uid_search}%", "%#{snippet_search}%", "%#{desc_search}%", "%#{lang_search}%"], :order => 'updated_at DESC')
	end
end

# coding: utf-8
'require "fileutils"'
'include "active_file"'

class Revista
	'include Mongoid::Document'
	field :titulo, type: String

end
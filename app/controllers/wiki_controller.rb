# -*- encoding: utf-8 -*-
class WikiController < ApplicationController
  def index
		@wiki = Wiki.find(:first,:include => :wiki_wikipages,:conditions => {"wiki_wikipages.wiki_id" => params[:id]})

		if @wiki.nil?
			render :text => "データが無いよ！"
		else
			render :text => "データが格納されています。"
		end
  end

  def show
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => params[:sub_id]})
  end

  def new
		if params[:id].nil?
			@wiki = Wiki.new
		else
			@page = Wiki.find(:first, :include => :wiki_wikipages, :conditions => {"wiki_wikipages.wiki_id" => params[:id]}).wikipages.build
		end
  end

  def create
		if params[:id].nil?
			wiki = Wiki.new(params[:wiki])
			page = wiki.wikipages.build

			page.title = "Wikiへようこそ！"
			page.owner_id = 0
			page.body = "hoge"

			wiki.save
			# redirect_to "/wiki/#{wiki.page_id}/index"
=begin
			if @wiki.save
				redirect_to "/wiki/index"
			else
				render :action => "/wiki/new"
			end
=end
		else
			
		end
  end

  def edit
		
  end

  def update

  end

  def destroy

  end
end


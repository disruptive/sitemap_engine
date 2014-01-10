class SitemapsController < ApplicationController
  layout false

  def index
    @sitemaps = [
      {
        :url        => sitemap_url(1),
        :last_mod   => File.ctime("#{Rails.root}/app/views/home/index.html.haml")
      }
    ]
    render 'sitemaps/index.xml.haml'
  end

  # paginate in batches of 50,000 urls, not to exceed 10MB
  # may be gzip-compressed
  def show
    @urls = [
      {
        :url        => root_url,
        :last_mod   => File.ctime("#{Rails.root}/app/views/home/index.html.haml"),
        :changefreq => 'weekly',
        :priority   => 1.0
      }
    ]
    Industry.parent_industries.each do |industry|
      @urls << {
        :url        => industry_url(industry.slug),
        :last_mod   => industry.updated_at,
        :changefreq => 'weekly',
        :priority   => 1.0
      }
      industry.children.each do |child_industry|
        @urls << {
          :url        => industry_url(child_industry.slug),
          :last_mod   => child_industry.updated_at,
          :changefreq => 'daily',
          :priority   => 1.0
        }
      end
    end
    Industry.all.each do |industry|
      industry.reports.each do |report|
        @urls << {
          :url        => industry_report_url(industry.slug, report.slug),
          :last_mod   => report.updated_at,
          :changefreq => 'weekly',
          :priority   => 1.0
        }
      end
    end
    render 'sitemaps/show.xml.haml'
  end
end
module ApplicationHelper
  def format_growth_rate(rate)
    if rate
      GROWTH_RATES[rate.downcase.to_sym]
    else
      "None"
    end
  end

  def default_meta_tags
    {
      site: 'Sprayze.com',
      title: "Sprayze",
      reverse: true,
      separator: '|',
      description: '',
      keywords: '',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      # icon: [
        # { href: image_url('favicon/favicon.ico')  },
        # { href: image_url('favicon/apple-touch-icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png'  },
      # ],
      og: {
        site_name: 'Sprayze.com',
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        # image: image_url('favicon/apple-touch-icon.png')
      }
    }
  end
end

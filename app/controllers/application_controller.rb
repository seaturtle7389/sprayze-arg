class ApplicationController < ActionController::Base

  def require_nft_routes
    unless request.subdomain == NFT_SUBDOMAIN
      redirect_to root_path
    end
  end

  def require_main_routes
    if request.subdomain == NFT_SUBDOMAIN
      redirect_to nft_root_url(subdomain: "nft"), allow_other_host: true
    end
  end

  def require_sprayze_membership
    unless current_user && current_user.sprayze_member
      redirect_to root_url(subdomain: ""), allow_other_host: true
    end
  end

end

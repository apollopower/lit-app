json.favorited signed_in? ? current_user.favorited?(article) : false
json.favorites_count article.favorites_count || 0

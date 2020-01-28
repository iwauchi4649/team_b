# ルート
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", mypage_path
end

# プロフィール
crumb :profile do
  link "プロフィール", profile_path
  parent :mypage
  # crumbとendの間にparentを設定することで親を設定することができる。
end

# 支払い方法
crumb :crcard_add do
  link "支払い方法", crcard_add_path
  parent :mypage
end

# サンプル
# crumb :sample do
#   link "サンプル", sample_path
#   parent : 
#   crumbとendの間にparentを設定することで親を設定することができる。
# end
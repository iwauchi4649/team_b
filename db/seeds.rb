lady = Category.create(name: "レディース")
lady_1 = lady.children.create(name: "トップス")
lady_1.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"},{name: "Tシャツ/カットソー(七分/長袖)"},〜〜〜{name: "その他"}])
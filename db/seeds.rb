seasonings = %w(
  塩 岩塩 藻塩
  砂糖 白砂糖 グラニュ糖 三温糖 きび砂糖 黒砂糖 氷砂糖
  醤油 濃口醤油 薄口醤油 甘口醤油 溜醤油 白醤油 だし醤油
)

seasonings.each do |seasoning|
  Seasoning.find_or_create_by(name: seasoning)
end

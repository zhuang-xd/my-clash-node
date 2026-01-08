year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
single_month=$(echo $month | sed 's/^0//')

declare -A map

# 定义sites与urls的关联数组
map["datiya"]="ttps://free.datiya.com/uploads/h$year/$month/$day-clash.yaml"
# 新增的条目：路径中的月份为单数字，文件名中的月份为两位数
#map["a.nodeshare.xyz"]="https://a.nodeshare.xyz/uploads/$year/$single_month/$year$month$day.yaml"

# 更新clash配置文件
for site in "${!map[@]}"; do
    url="${map[$site]}"
    wget "$url" -O "$site.yaml"
done

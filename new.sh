#!/bin/bash
# 创建新文章脚本
echo "======================================"
echo "  Hexo 新建文章"
echo "======================================"
read -p "文章标题: " title
if [ -z "$title" ]; then
  echo "标题不能为空!"
  exit 1
fi

read -p "标签 (用逗号分隔): " tags_input
# 生成 hexo new 命令
hexo new "$title"

# 找到刚创建的文件
post_dir="source/_posts"
latest=$(ls -t "$post_dir" | head -1)

if [ -f "$post_dir/$latest" ]; then
  # 在 front-matter 中添加标签
  if [ -n "$tags_input" ]; then
    # 把逗号分隔的标签转成 YAML 列表
    IFS=',' read -ra TAGS <<< "$tags_input"
    # 在 --- 之后插入 tags
    tag_lines=""
    for tag in "${TAGS[@]}"; do
      tag=$(echo "$tag" | xargs)  # trim
      tag_lines="$tag_lines  - $tag"$'\n'
    done
    # 用 sed 在第二个 --- 之前插入 tags
    sed -i "0,/---/!b; /---/ {n; i\\
tags:$'\n'$tag_lines
}" "$post_dir/$latest"
    echo "✅ 标签已添加"
  fi
  echo "📝 文件已创建: $post_dir/$latest"
  echo "   用编辑器打开编辑文章内容吧~"
fi

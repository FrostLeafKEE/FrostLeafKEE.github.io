#!/bin/bash
# 一键部署脚本
echo "======================================"
echo "  Hexo 一键部署"
echo "======================================"
echo ""
echo "📦 正在生成静态文件..."
hexo clean && hexo generate

if [ $? -ne 0 ]; then
  echo "❌ 生成失败，请检查错误信息"
  exit 1
fi

echo ""
echo "🚀 正在部署到 GitHub Pages..."
hexo deploy

if [ $? -eq 0 ]; then
  echo ""
  echo "✅ 部署完成！稍后访问 https://FrostLeafKEE.github.io 查看"
  echo ""
  echo "💾 是否备份源文件到 main 分支? (y/n)"
  read -p "> " backup
  if [ "$backup" = "y" ]; then
    git add . && git commit -m "更新: $(date '+%Y-%m-%d %H:%M')" && git push origin main
    echo "✅ 源文件已备份"
  fi
else
  echo "❌ 部署失败，请检查网络或仓库设置"
fi

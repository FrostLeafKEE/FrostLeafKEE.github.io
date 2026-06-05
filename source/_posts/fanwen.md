---
title: 文章标题写这里
date: 2026-06-05 20:30:00
tags:
  - 博客
  - 生活
categories: 日常
---

## 第一个段落

这里是正文。用 Markdown 语法写就可以了。

**加粗文字**、*斜体文字*。

## 插入图片

**步骤：**

1. 把图片文件放到 `source/img/` 文件夹
2. 在文章里用下面格式引用：

```markdown
![图片描述](/img/你的图片名.png)
```

**示例：**

```markdown
![风景图](/img/fengjing.png)
![我的头像](/img/avatar.png)
```

> 💡 图片路径统一用 `/img/xxx`，不管文章在哪个目录都能正确显示。

## 代码块

```python
print("Hello, FrostLeafKEE!")
```

## 链接

[链接文字](https://example.com)

## 引用

> 这是一段引用文字。

## 列表

- 项目一
- 项目二
- 项目三

---

写完后运行 `./deploy.sh` 即可发布。

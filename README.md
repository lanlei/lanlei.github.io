# 个人主页维护备忘

这个仓库是个人学术主页的 Jekyll 版本。网站正文保持英文；这个 README 是给自己以后维护时看的。

## 常用文件

- `_pages/about.md`: 首页正文，包括 About 和 Publications 的入口。
- `_data/publications.yml`: 所有论文数据。以后新增、删除、调整论文顺序，主要改这里。
- `_includes/publication-card.html`: 带图片论文卡片模板。通常不用改。
- `_includes/publication-simple.html`: 无图片普通论文条目模板。通常不用改。
- `assets/css/main.scss`: 页面样式，publication 卡片尺寸、字体、间距都在这里。
- `images/project/`: 论文图片放这里。
- `images/icons/`: PDF 和 video 图标放这里。

## 本地预览

推荐直接运行：

```bash
./run_server.sh
```

然后打开：

```text
http://127.0.0.1:4000
```

如果只想检查能不能构建：

```bash
LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 BUNDLE_PATH=vendor/bundle bundle exec jekyll build
```

看到 `GitHub Metadata: No GitHub API authentication could be found` 一般没关系，本地构建可以忽略。

## 新增一篇带图片论文

1. 把论文图片放到 `images/project/`，例如 `images/project/new-paper.png`。
2. 打开 `_data/publications.yml`。
3. 在 `featured:` 下面复制一整段已有论文，改成新论文内容。

模板如下：

```yml
- title: "Paper Title"
  image: "images/project/new-paper.png"
  alt: "Paper Title"
  badge: "SIGGRAPH 2026"
  tags:
    - "Simulation"
    - "GPU"
  authors: "<strong>Lei Lan</strong>, Coauthor A, Coauthor B"
  venue: "<em>ACM Transactions on Graphics</em>, 2026."
  pdf: "https://..."
  video: "https://..."
```

字段说明：

- `title`: 论文标题。
- `image`: 论文图片路径，从仓库根目录开始写。
- `alt`: 图片替代文本，通常和标题一样即可。
- `badge`: 会议或期刊短标签。当前样式隐藏了图片上的蓝色 badge，但数据可以保留。
- `tags`: 灰色小标签，会自动显示成 `#Tag`。
- `authors`: 作者列表。自己的名字可以用 `<strong>Lei Lan</strong>` 加粗。
- `venue`: 发表信息。期刊或会议名可以用 `<em>...</em>` 斜体。
- `pdf`: PDF 或论文链接。没有链接时可以删掉。
- `video`: 视频链接。没有链接时可以删掉。

如果 PDF 和 video 链接还没有，但想先显示两个图标：

```yml
placeholder_links: true
```

如果不想显示任何图标，就不要写 `pdf`、`video`、`placeholder_links`。

### 论文图片尺寸

Publication 图片槽固定为：

```text
304 px × 171 px
```

比例是 `16:9`。页面会把图片放进这个固定灰色图片槽里，并使用等比例缩放：

- 图片不会被拉伸。
- 图片不会被裁剪。
- 如果图片本身不是 `16:9`，图片槽里会留出灰色空白边。

以后新增论文图片时，最省心的做法是直接准备 `16:9` 图片，例如 `1216 × 684 px`、`912 × 513 px` 或 `608 × 342 px`。不要为了填满图片槽强行拉伸图片。

## 新增一篇无图片论文

在 `_data/publications.yml` 的 `simple:` 下面复制一段：

```yml
- title: "Paper Title"
  authors: "Author A, <strong>Lei Lan</strong>, Author B."
  venue: "<em>Journal Name</em>, 2026."
```

## 调整论文顺序

直接在 `_data/publications.yml` 里移动整段论文数据即可。页面显示顺序和 YAML 文件顺序一致。

## 修改首页其他内容

打开 `_pages/about.md`：

- About 段落在 `about-me` 后面。
- Publications 不需要手写 HTML，它会自动读取 `_data/publications.yml`。

## 修改 publication 样式

打开 `assets/css/main.scss`，搜索：

```scss
.paper-box
```

常见可调项：

- `max-width`: 每张论文卡片最大宽度。
- `height`: 每张论文卡片高度。
- `.paper-box-image`: 论文图片尺寸。
- `.paper-title`: 标题字体。
- `.paper-authors` 和 `.paper-venue`: 作者与 venue 字体。
- `.paper-links`: PDF/video 图标位置。

## 维护时的小提醒

- YAML 缩进很重要，用两个空格，不要用 tab。
- 带冒号、星号、HTML 标签的字段建议用双引号包起来。
- 改完后先跑一次 `bundle exec jekyll build`，再刷新本地页面。
- 如果刷新后样式没变，可以强制刷新浏览器，或者重启 `./run_server.sh`。

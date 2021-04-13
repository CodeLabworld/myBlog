hexo clean
hexo g
hexo d
git init
git checkout -b backup
git add .
git commit -m "Blog更新"
git remote add origin git@github.com:CodeLabworld/myBlog.git
git push origin backup

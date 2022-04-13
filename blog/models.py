from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse
from django.utils.text import slugify

class Post_Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self): 
        return self.name


class Post(models.Model):
    title = models.CharField(max_length = 100)
    slug = models.SlugField(max_length=200 ,default='',unique =False)
    content = models.TextField()
    date_posted = models.DateTimeField(default = timezone.now)
    author = models.ForeignKey(User, on_delete = models.CASCADE)
    category = models.ForeignKey(Post_Category, on_delete= models.CASCADE,default=True, null = False) 
    views = models.IntegerField(default=0)
    #likes = models.ManyToManyField(User,related_name= 'blog_posts')

    #def total_likes(self):
    #    return self.likes.count()

    def __str__(self): 
        return self.title

    #lay url cua 1 bai post cu the
    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})       #reverse dua ve lai url 

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super(Post, self).save(*args, **kwargs)    
    
class PostLike(models.Model):
    like_users = models.ManyToManyField(User)
    like_posts = models.ForeignKey(Post,on_delete=models.CASCADE,null=True,related_name='likepost')



class Comment(models.Model):
    comment = models.TextField()
    created_on = models.DateTimeField(default = timezone.now)
    author = models.ForeignKey(User,on_delete = models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    parent = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE,related_name='+')

    class Meta:
        ordering = ('-created_on',)

    def __str__(self):
        return f'Comment by {self.author.__str__} on {self.post}'

    def children(self):
        return Comment.objects.filter(parent=self)

    @property
    def is_parent(self):
        if self.parent is not None:
            return False
        return True


class Techtalk(models.Model):
    title = models.CharField(max_length=50)
    slug = models.SlugField(max_length=200 ,default='',unique =False)
    content=models.TextField()
    start_on = models.DateTimeField()
    author = models.ForeignKey(User,on_delete = models.CASCADE)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super(Post, self).save(*args, **kwargs) 

class TechtalkLike(models.Model):
    like_users = models.ManyToManyField(User)
    like_techtalks = models.ForeignKey(Techtalk,on_delete=models.CASCADE,null=True,related_name='liketechtalk')

class TechtalkSubcribe(models.Model):
    subcribe_users = models.ManyToManyField(User)
    subcribe_techtalks = models.ForeignKey(Techtalk,on_delete=models.CASCADE,null=True,related_name='subcribetechtalk')

class Learn(models.Model):
    title = models.CharField(max_length=50)
    slug = models.SlugField(max_length=200 ,default='',unique =False)
    content = models.TextField()
    created_on = models.DateTimeField(default = timezone.now)
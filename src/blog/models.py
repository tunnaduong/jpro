import imp
from multiprocessing.spawn import import_main_path
from django.db import models
from datetime import datetime
from django.contrib.auth.models import User


STATUS = (
    ('discussion',"Discussion"),
    ('learning',"Learning")
)

class Post(models.Model):
    title               = models.CharField(max_length=200, unique=True)
    slug                = models.SlugField(max_length=200, unique=True)
    author              = models.ForeignKey(User, on_delete= models.CASCADE,related_name='blog_posts')
    updated_on          = models.DateTimeField(auto_now= True)
    created_on          = models.DateTimeField(auto_now_add=True)
    content             = models.TextField()
    status              = models.CharField(max_length=20,choices=STATUS, default='discussion')
    is_published        = models.BooleanField(default=True)
    blog_views          = models.IntegerField(default=0)

    class Meta:
        ordering = ['-created_on']

    def __str__(self):
        return self.title
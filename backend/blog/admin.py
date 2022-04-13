from django.contrib import admin
from .models import  Post, Post_Category,Comment
# Register your models here.
admin.site.register(Post)
admin.site.register(Post_Category)
admin.site.register(Comment)